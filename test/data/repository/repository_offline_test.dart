import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travelbox/data/repository/repository_imp.dart';
import 'package:travelbox/domain/data_source/remote/remote_data_source.dart';
import 'package:travelbox/domain/failure/failure.dart';
import 'package:travelbox/domain/network/network.dart';
import 'package:travelbox/domain/repository/repository.dart';
import 'package:travelbox/features/cover_quote/model/country.dart';
import 'package:travelbox/features/cover_quote/model/cover.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';

import '../../mocks/mock_network_info_offline.dart';
import '../../mocks/generated_mocks/remote_data_source.mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  late RemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;
  late Repository repository;

  setUpAll(() {
    remoteDataSource = MockRemoteDataSource();
    networkInfo = MockNetworkInfoOffline();
    repository = RepositoryImp(
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
    );
  });

  group('test cases for register user function', () {
    test('check user register function', () async {
      when(remoteDataSource.userRegister(registerRequest))
          .thenAnswer((realInvocation) async {
        return 'ajdfao-i024-8okos';
      });
      expect(() async => await repository.userRegister(registerRequest),
          throwsA(isInstanceOf<NoInternetException>()));
    });
  });

  group('test cases for get quotes function', () {
    test('check get quotes function', () async {
      when(remoteDataSource.getQuote(getQuoteRequest))
          .thenAnswer((realInvocation) async {
        return Future.value([Quote.fromJson(getQuoteWithoutListJsonResponse)]);
      });
      expect(() async => await repository.getQuote(getQuoteRequest),
          throwsA(isInstanceOf<NoInternetException>()));
    });
  });

  group('test cases for get covers function', () {
    test('check get covers function', () async {
      when(remoteDataSource.getCovers(getCoverRequest))
          .thenAnswer((realInvocation) async {
        return Future.value(
            [Cover.fromJson(getCoverJsonResponse['offers']!.first)]);
      });
      expect(() async => await repository.getCovers(getCoverRequest),
          throwsA(isInstanceOf<NoInternetException>()));
    });
  });

  group('test cases for get countries function', () {
    test('check get countries function', () async {
      when(remoteDataSource.getCountries(getCountryRequest))
          .thenAnswer((realInvocation) async {
        return [CountryModel(countryCode: 'PK', countryName: 'Pakistan')];
      });
      expect(() async => await repository.getCountries(getCountryRequest),
          throwsA(isInstanceOf<NoInternetException>()));
    });
  });
}
