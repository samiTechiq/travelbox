import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travelbox/domain/failure/failure.dart';
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/wrapper_error_handler.dart';

void main() {
  late ErrorHandler errorHandler;

  setUpAll(() {
    errorHandler = ErrorHandlerImpl();
  });

  group('test cases for resolveErrors method', () {
    test('test case for status code 500', () {
      final result = errorHandler.resolveErrors(
          response:
              Response(requestOptions: RequestOptions(), statusCode: 500));
      expect(result.runtimeType, InternalServerError);
    });

    test('test case for status code 404', () {
      final result = errorHandler.resolveErrors(
          response:
              Response(requestOptions: RequestOptions(), statusCode: 404));
      expect(result.runtimeType, DefaultFailure);
    });

    test('test case for status code 204', () {
      final result = errorHandler.resolveErrors(
          response:
              Response(requestOptions: RequestOptions(), statusCode: 204));
      expect(result.runtimeType, DefaultFailure);
    });

    test('test case for status code 400', () {
      final result = errorHandler.resolveErrors(
          response: Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
              data: {'statusCode': 400}));
      expect(result.runtimeType, DefaultFailure);
    });

    test('test case for status code 401', () {
      final result = errorHandler.resolveErrors(
          response:
              Response(requestOptions: RequestOptions(), statusCode: 401));
      expect(result.runtimeType, DefaultFailure);
    });

    test('test case for status code other then known', () {
      final result = errorHandler.resolveErrors(
          response: Response(requestOptions: RequestOptions(), statusCode: -1));
      expect(result.runtimeType, DefaultFailure);
    });
  });

  test('test case for handle400StatusCode', () {
    final result = errorHandler.handle400StatusCode(400);
    expect(result.runtimeType, DefaultFailure);
  });

  test('test case for checking method is throwing correct failure', () {
    final result = errorHandler.throwDefaultFailure();
    expect(result.runtimeType, DefaultFailure);
  });
}
