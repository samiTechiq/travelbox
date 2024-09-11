// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travelbox/data/data_source/remote_data_source/remote_data_source_imp.dart';
import 'package:travelbox/domain/data_source/remote/remote_data_source.dart';
import 'package:travelbox/domain/failure/failure.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/network_call_wrapper.dart';

import '../../mocks/generated_mocks/network_call.mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RemoteDataSource remoteDataSource;
  late NetworkCallsWrapper http;

  setUpAll(() {
    R.setData(MediaQueryData.fromView(WidgetsBinding.instance.window));

    http = MockNetworkCallsWrapper();
    remoteDataSource = RemoteDataSourceImp(http: http);
  });
  group('test cases for register user function', () {
    test('check user register api with status code 200', () async {
      when(http.onPost(api: 'v1/user/register', data: registerRequest.toJson()))
          .thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: {'userId': 'ajdfao-i024-8okos'});
      });
      final result = await remoteDataSource.userRegister(registerRequest);
      expect(result, 'ajdfao-i024-8okos');
    });

    test('check user register api with status code 201', () async {
      when(http.onPost(api: 'v1/user/register', data: registerRequest.toJson()))
          .thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 201,
            data: {'userId': 'ajdfao-i024-8okos'});
      });
      final result = await remoteDataSource.userRegister(registerRequest);
      expect(result, 'ajdfao-i024-8okos');
    });

    test('check user register api with status code 400', () async {
      when(http.onPost(api: 'v1/user/register', data: registerRequest.toJson()))
          .thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 400,
            data: {'message': 'kindly check your email'});
      });
      expect(() async => await remoteDataSource.userRegister(registerRequest),
          throwsA(isInstanceOf<DefaultFailure>()));
    });
  });

  group('test cases for get covers function', () {
    test('check get cover api with status code 200', () async {
      when(http.onGet(api: 'v1/offer', headers: {
        'language': getCoverRequest.language,
        'country': getCoverRequest.country
      })).thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: getCoverJsonResponse);
      });
      final result = await remoteDataSource.getCovers(getCoverRequest);
      expect(result.first.toJson(), getCoverJsonResponse['offers']?.first);
    });

    test('check get cover api with status code 201', () async {
      when(http.onGet(api: 'v1/offer', headers: {
        'language': getCoverRequest.language,
        'country': getCoverRequest.country
      })).thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: getCoverJsonResponse);
      });
      final result = await remoteDataSource.getCovers(getCoverRequest);
      expect(result.first.toJson(), getCoverJsonResponse['offers']?.first);
    });

    test('check get cover api with status code 400', () async {
      when(http.onGet(api: 'v1/offer', headers: {
        'language': getCoverRequest.language,
        'country': getCoverRequest.country
      })).thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 400,
            data: {'message': 'kindly check your email'});
      });
      expect(() async => await remoteDataSource.getCovers(getCoverRequest),
          throwsA(isInstanceOf<DefaultFailure>()));
    });
  });

  group('test cases for get quotes function', () {
    test('check get quotes api with status code 200', () async {
      when(http.onPost(
              api: 'v1/quote',
              headers: {
                'language': getCoverRequest.language,
                'country': getCoverRequest.country
              },
              data: getQuoteRequest.toJson()))
          .thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: getQuoteJsonResponse);
      });
      final result = await remoteDataSource.getQuote(getQuoteRequest);
      expect(result.first.toJson(),
          Quote.fromJson(getQuoteWithoutListJsonResponse).toJson());
    });

    test('check get quotes api with status code 201', () async {
      when(http.onPost(
              api: 'v1/quote',
              headers: {
                'language': getCoverRequest.language,
                'country': getCoverRequest.country
              },
              data: getQuoteRequest.toJson()))
          .thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: getQuoteJsonResponse);
      });
      final result = await remoteDataSource.getQuote(getQuoteRequest);
      expect(result.first.toJson(),
          Quote.fromJson(getQuoteWithoutListJsonResponse).toJson());
    });

    test('check get quotes api with status code 400', () async {
      when(http.onPost(
              api: 'v1/quote',
              headers: {
                'language': getCoverRequest.language,
                'country': getCoverRequest.country
              },
              data: getQuoteRequest.toJson()))
          .thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 400,
            data: {'message': 'kindly check your email'});
      });
      expect(() async => await remoteDataSource.getQuote(getQuoteRequest),
          throwsA(isInstanceOf<DefaultFailure>()));
    });
  });

  group('test cases for get countries function', () {
    test('check get countries api with status code 200', () async {
      when(http.onGet(api: 'v1/country', headers: {
        'language': getCoverRequest.language,
        'country': getCoverRequest.country
      })).thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: geCountryJsonResponse);
      });
      final result = await remoteDataSource.getCountries(getCountryRequest);
      expect(result.first.toJson(), geCountryJsonResponse.first);
    });

    test('check get countries api with status code 201', () async {
      when(http.onGet(api: 'v1/country', headers: {
        'language': getCoverRequest.language,
        'country': getCoverRequest.country
      })).thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: geCountryJsonResponse);
      });
      final result = await remoteDataSource.getCountries(getCountryRequest);
      expect(result.first.toJson(), geCountryJsonResponse.first);
    });

    test('check get countries api with status code 400', () async {
      when(http.onGet(api: 'v1/country', headers: {
        'language': getCoverRequest.language,
        'country': getCoverRequest.country
      })).thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(),
            statusCode: 400,
            data: {'message': 'kindly check your email'});
      });
      expect(() async => await remoteDataSource.getCountries(getCountryRequest),
          throwsA(isInstanceOf<DefaultFailure>()));
    });
  });
}
