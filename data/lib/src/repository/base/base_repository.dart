
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:logger/logger.dart';

typedef Mapper<Entity, Model> = Model Function(Entity entity);

abstract class BaseRepository {
  final _logger = Logger();

  Future<Result<ResponseType>> safeCall<RequestType, ResponseType>(Future<RequestType> call,
      {Mapper<RequestType, ResponseType> mapper}) async {
    try {
      var response = await call;
      _logger.d("Api success message -> $response");
      return Success(mapper?.call(response) ?? response);
    } catch (exception) {
      _logger.e("Api error message -> ${exception.message}");
      _logger.e(exception);
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.CONNECT_TIMEOUT:
          case DioErrorType.SEND_TIMEOUT:
          case DioErrorType.RECEIVE_TIMEOUT:
          case DioErrorType.CANCEL:
            return Error(ErrorType.POOR_NETWORK, exception.message);
            break;

          case DioErrorType.DEFAULT:
            return Error(ErrorType.NO_NETWORK, exception.message);
            break;

          case DioErrorType.RESPONSE:
            return Error(ErrorType.GENERIC, exception.message);
            break;
        }
      }
      return Error(ErrorType.GENERIC, "Unknown error");
    }
  }
}
