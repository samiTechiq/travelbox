// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travelbox/domain/failure/failure.dart';
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/network_call_wrapper.dart';
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/wrapper_error_handler.dart';

import '../../../../../mocks/generated_mocks/demo_test.mocks.dart';

void main() {
  late NetworkCallsWrapper networkCallsWrapper;
  late Dio dio;

  setUpAll(() {
    dio = MockDio();
    networkCallsWrapper = DioWrapperImpl(
      dio: dio,
      logger: MockLogger(),
      errorHandler: ErrorHandlerImpl(),
    );
  });

  group('test cases for onPost method', () {
    test('check onPost method 200 response', () async {
      when(dio.post('vi/user/register', data: {'name': 'Ahmad'})).thenAnswer(
        (realInvocation) => Future.value(
          Response(requestOptions: RequestOptions(), data: {'statusCode': 200}),
        ),
      );
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      final result = await networkCallsWrapper
          .onPost(api: 'vi/user/register', data: {'name': 'Ahmad'});
      final statusCode = result.data['statusCode'];
      expect(statusCode, 200);
    });

    test('check onPost method 500 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 500,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.post('vi/user/register', data: {'name': 'Ahmad'}))
          .thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper
              .onPost(api: 'vi/user/register', data: {'name': 'Ahmad'}),
          throwsA(isInstanceOf<InternalServerError>()));
    });

    test('check onPost method 404 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 404,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.post('vi/user/register', data: {'name': 'Ahmad'}))
          .thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper
              .onPost(api: 'vi/user/register', data: {'name': 'Ahmad'}),
          throwsA(isInstanceOf<DefaultFailure>()));
    });

    test('check onPost method 204 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 204,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.post('vi/user/register', data: {'name': 'Ahmad'}))
          .thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper
              .onPost(api: 'vi/user/register', data: {'name': 'Ahmad'}),
          throwsA(isInstanceOf<DefaultFailure>()));
    });

    test('check onPost method 400 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 400,
          data: {'message': 'Internal Server Error', 'statusCode': 400},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.post('vi/user/register', data: {'name': 'Ahmad'}))
          .thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper
              .onPost(api: 'vi/user/register', data: {'name': 'Ahmad'}),
          throwsA(isInstanceOf<DefaultFailure>()));
    });
    test('check onPost method 401 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 401,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.post('vi/user/register', data: {'name': 'Ahmad'}))
          .thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper
              .onPost(api: 'vi/user/register', data: {'name': 'Ahmad'}),
          throwsA(isInstanceOf<DefaultFailure>()));
    });

    test('check onPost method response other than known', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 1000,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.post('vi/user/register', data: {'name': 'Ahmad'}))
          .thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper
              .onPost(api: 'vi/user/register', data: {'name': 'Ahmad'}),
          throwsA(isInstanceOf<DefaultFailure>()));
    });
  });

  group('test cases for onGet method', () {
    test('check onPost method 200 response', () async {
      when(dio.get('vi/user/register')).thenAnswer(
        (realInvocation) => Future.value(
          Response(requestOptions: RequestOptions(), data: {'statusCode': 200}),
        ),
      );
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      final result = await networkCallsWrapper.onGet(api: 'vi/user/register');
      final statusCode = result.data['statusCode'];
      expect(statusCode, 200);
    });

    test('check onGet method 500 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 500,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.get('vi/user/register')).thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper.onGet(api: 'vi/user/register'),
          throwsA(isInstanceOf<InternalServerError>()));
    });

    test('check onGet method 404 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 404,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.get('vi/user/register')).thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper.onGet(api: 'vi/user/register'),
          throwsA(isInstanceOf<DefaultFailure>()));
    });

    test('check onGet method 204 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 204,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.get('vi/user/register')).thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper.onGet(api: 'vi/user/register'),
          throwsA(isInstanceOf<DefaultFailure>()));
    });

    test('check onGet method 400 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 400,
          data: {'message': 'Internal Server Error', 'statusCode': 400},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.get('vi/user/register', data: {'name': 'Ahmad'}))
          .thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper.onGet(api: 'vi/user/register'),
          throwsA(isInstanceOf<DefaultFailure>()));
    });
    test('check onGet method 401 response', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 401,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.get('vi/user/register')).thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper.onGet(api: 'vi/user/register'),
          throwsA(isInstanceOf<DefaultFailure>()));
    });

    test('check onGet method response other than known', () async {
      final dioError = DioError(
        response: Response(
          statusCode: 1000,
          data: {'message': 'Internal Server Error'},
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/v1/user/register'),
        type: DioErrorType.badResponse,
      );
      when(dio.get('vi/user/register')).thenThrow(dioError);
      when(dio.options).thenAnswer((realInvocation) => BaseOptions());
      expect(
          () async => await networkCallsWrapper.onGet(api: 'vi/user/register'),
          throwsA(isInstanceOf<DefaultFailure>()));
    });
  });
}
