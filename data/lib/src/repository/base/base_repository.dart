
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:logger/logger.dart';

typedef Mapper<Entity, Model> = Model Function(Entity entity);

abstract class BaseRepository {
  final _logger = Logger();

  Future<Result<ResponseType>> safeCall<RequestType, ResponseType>(Future<RequestType> call,
      {required Mapper<RequestType, ResponseType> mapper}) async {
    try {
      var response = await call;
      _logger.d("Api success message -> $response");
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
      return Error(ErrorType.GENERIC, "Unknown error");
    }
  }
}
