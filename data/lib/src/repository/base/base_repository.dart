import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:floor/floor.dart';
import 'package:logger/logger.dart';

typedef ResponseToModelMapper<Response, Model> = Model Function(Response response);
typedef EntityToModelMapper<Entity, Model> = Model? Function(Entity? entity);
typedef SaveResult<Response> = Future Function(Response response);

abstract class BaseRepository {
  final _logger = Logger();

  Future<Result<Model>> safeDbCall<Entity, Model>(
      Future<Entity?> call,
      {required EntityToModelMapper<Entity, Model> mapper}) async {
    try {
      final response = await call;
      if(response != null) {
        _logger.d("DB success message -> $response");
        return Success(mapper.call(response)!);
      } else {
        _logger.d("DB response is null");
        return Error(ErrorType.GENERIC, "DB response is null!");
      }
    } catch (exception) {
      _logger.d("DB failure message -> $exception");
      return Error(ErrorType.GENERIC, "Unknown DB error");
    }
  }

  Future<Result<Model>> safeApiCall<Response, Model>(
      Future<Response> call,
      {required ResponseToModelMapper<Response, Model> mapper,
      SaveResult<Response>? saveResult}) async {
    try {
      var response = await call;
      _logger.d("Api success message -> $response");
      await saveResult?.call(response);
      return Success(mapper.call(response));
    } on Exception catch (exception) {
      _logger.e("Api error message -> ${exception.toString()}");
      _logger.e(exception);
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return Error(ErrorType.POOR_NETWORK, exception.message);

          case DioErrorType.other:
            return Error(ErrorType.NO_NETWORK, exception.message);

          case DioErrorType.response:
            return Error(ErrorType.GENERIC, exception.message);
        }
      }
      return Error(ErrorType.GENERIC, "Unknown API error");
    }
  }
}
