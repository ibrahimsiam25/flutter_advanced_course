import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  //late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return dioExceptionHandlers(error);
    } else {
      return ApiErrorModel(message: "Something went wrong");
    }
  }

  static ApiErrorModel dioExceptionHandlers(DioException error) {
        switch (error.type) {
      case DioExceptionType.connectionError:
        return ApiErrorModel(message: "Connection to server failed");
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(message: "Connection to server timed out");
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
            message: "Receive timeout in connection with server");
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
            message: "Send timeout in connection with server");
      case DioExceptionType.cancel:
        return ApiErrorModel(message: "Request to server was cancelled");
      case DioExceptionType.unknown:
        return ApiErrorModel(message: "Unexpected error occured");
      case DioExceptionType.badResponse:
        return _handleError(error.response?.data);
      default:
        return ApiErrorModel(message: "Something went wrong");
    }
  }
}

//to show map of errors like email, password etc required
ApiErrorModel _handleError(dynamic errorResponse) {
return ApiErrorModel
(
  message: errorResponse["message"]??"unknown error occured",
  code: errorResponse["code"],
  errorsMap: errorResponse['data'],
  );
  
}
