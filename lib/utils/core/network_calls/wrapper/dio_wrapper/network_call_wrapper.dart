// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/wrapper_error_handler.dart';

abstract class NetworkCallsWrapper {
  Future<Response<dynamic>> onPost({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
    String? baseUrl,
  });

  Future<Response<dynamic>> onGet({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
    String? baseUrl,
  });

  void resolveAPIMetadata({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
    String? baseUrl,
  });
}

@LazySingleton(as: NetworkCallsWrapper)
class DioWrapperImpl implements NetworkCallsWrapper {
  final Dio _dio;
  final Logger _logger;
  final ErrorHandler _errorHandler;

  DioWrapperImpl({
    required Dio dio,
    required Logger logger,
    required ErrorHandler errorHandler,
  })  : _dio = dio,
        _logger = logger,
        _errorHandler = errorHandler;

  @override
  Future<Response<dynamic>> onPost({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
    String? baseUrl,
  }) async {
    try {
      resolveAPIMetadata(
          queryParameters: queryParameters,
          headers: headers,
          jwt: jwt,
          baseUrl: baseUrl);
      return await _dio.post(api, data: data);
    } on DioError catch (e) {
      _logger.wtf('[ON POST | DIO ERROR] [API | $api] ${e.response}');
      if (e.type == DioErrorType.badResponse) {
        throw _errorHandler.resolveErrors(response: e.response!);
      }
      throw _errorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON POST | SOMETHING GOES WRONG IN API CALL] $e');
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>> onGet({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
    String? baseUrl,
  }) async {
    try {
      resolveAPIMetadata(
          queryParameters: queryParameters,
          headers: headers,
          jwt: jwt,
          baseUrl: baseUrl);
      return await _dio.get(api);
    } on DioError catch (e) {
      _logger.wtf('[ON GET | DIO ERROR] [API | $api] $e');
      if (e.type == DioErrorType.badResponse) {
        throw _errorHandler.resolveErrors(response: e.response!);
      }
      throw _errorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON GET | SOMETHING GOES WRONG IN API CALL] $e');
      throw _errorHandler.throwDefaultFailure();
    }
  }

  @override
  void resolveAPIMetadata({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
    String? baseUrl,
  }) {
    _dio.options.queryParameters.clear();
    if (queryParameters != null) {
      _dio.options.queryParameters.addAll(queryParameters);
    }
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    if (baseUrl != null) {
      _dio.options.baseUrl = baseUrl;
    }
    if (jwt != null) {
      _dio.interceptors
          .addAll([CustomInterceptors(jwt: jwt, dio: _dio, logger: _logger)]);
    }
  }
}
