import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travelbox/data/repository/repository_imp.dart';
import 'package:travelbox/domain/data_source/remote/remote_data_source.dart';
import 'package:travelbox/domain/network/network.dart';
import 'package:travelbox/domain/repository/repository.dart';
import 'package:travelbox/features/cover_quote/model/country.dart';
import 'package:travelbox/features/cover_quote/model/cover.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';

import '../../mocks/mock_network_info_online.dart';
import '../../mocks/generated_mocks/remote_data_source.mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  late RemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;
  late Repository repository;

  setUpAll(() {
    remoteDataSource = MockRemoteDataSource();
    networkInfo = MockNetworkInfoOnline();
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
      final result = await repository.userRegister(registerRequest);
      expect(result, 'ajdfao-i024-8okos');
    });
  });

  group('test cases for get quotes function', () {
    test('check get quotes function', () async {
      when(remoteDataSource.getQuote(getQuoteRequest))
          .thenAnswer((realInvocation) async {
        return Future.value([Quote.fromJson(getQuoteWithoutListJsonResponse)]);
      });
      final result = await repository.getQuote(getQuoteRequest);
      expect(result.first.toJson(),
          Quote.fromJson(getQuoteWithoutListJsonResponse).toJson());
    });
  });

  group('test cases for get covers function', () {
    test('check get covers function', () async {
      when(remoteDataSource.getCovers(getCoverRequest))
          .thenAnswer((realInvocation) async {
        return Future.value(
            [Cover.fromJson(getCoverJsonResponse['offers']!.first)]);
      });
      final result = await repository.getCovers(getCoverRequest);
      expect(result.first.toJson(),
          Cover.fromJson(getCoverJsonResponse['offers']!.first).toJson());
    });
  });

  group('test cases for get countries function', () {
    test('check get countries function', () async {
      when(remoteDataSource.getCountries(getCountryRequest))
          .thenAnswer((realInvocation) async {
        return [CountryModel(countryCode: 'PK', countryName: 'Pakistan')];
      });
      final result = await repository.getCountries(getCountryRequest);
      expect(result.first.toJson(),
          CountryModel(countryCode: 'PK', countryName: 'Pakistan').toJson());
    });
  });
}
