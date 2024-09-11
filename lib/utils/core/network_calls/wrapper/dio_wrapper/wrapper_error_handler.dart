import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:travelbox/domain/failure/failure.dart';

abstract class ErrorHandler {
  Failure resolveErrors({required Response<dynamic> response});

  Failure handle400StatusCode(int internalCode);

  Failure throwDefaultFailure();
}

@LazySingleton(as: ErrorHandler)
class ErrorHandlerImpl extends ErrorHandler {
  @override
  Failure resolveErrors({required Response<dynamic> response}) {
    switch (response.statusCode) {
      case 500:
        return InternalServerError('internal_error');
      case 404:
        return DefaultFailure('not_found');
      case 204:
        return DefaultFailure('content_not_found');
      case 400:
        return handle400StatusCode(response.data['statusCode']);
      case 401:
        return DefaultFailure('un_authorized_request');
      default:
        return DefaultFailure('something_went_wrong');
    }
  }

  @override
  Failure handle400StatusCode(int internalCode) {
    switch (internalCode) {
      default:
        return DefaultFailure('something_went_wrong');
    }
  }

  @override
  Failure throwDefaultFailure() {
    return DefaultFailure('something_went_wrong');
  }

}

class CustomInterceptors extends Interceptor {
  final String jwt;
  final Logger logger;
  final Dio dio;

  CustomInterceptors({
    required this.jwt,
    required this.dio,
    required this.logger,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $jwt';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }
}
