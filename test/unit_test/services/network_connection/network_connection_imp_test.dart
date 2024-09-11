import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travelbox/data/data_source/network_connection/network_connection_imp.dart';
import 'package:travelbox/data/mapper/connection_type_mapper.dart';
import 'package:travelbox/domain/data_source/network_connection/network_connection.dart';
import 'package:travelbox/domain/mapper/mapper.dart';
import 'package:travelbox/domain/model/connection_type/connection_type.dart';

import '../../../mocks/generated_mocks/connectivity.mocks.dart';

void main() {
  late Connectivity connectivity;
  late Mapper<ConnectivityResult, ConnectionType> mapper;
  late NetworkConnection networkConnection;

  setUpAll(() {
    connectivity = MockConnectivity();
    mapper = ConnectionTypeMapper();
    networkConnection = NetworkConnectionImpl(connectivity, mapper);
  });

  group('Test cases for getType method', () {
    test('should return wifi if connected to wifi', () async {
      when(connectivity.checkConnectivity()).thenAnswer(
          (realInvocation) => Future.value(ConnectivityResult.wifi));
      final result = await networkConnection.getType();
      expect(ConnectionType.wifi, result);
    });

    test('should return mobile if connected to mobile network', () async {
      when(connectivity.checkConnectivity()).thenAnswer(
          (realInvocation) => Future.value(ConnectivityResult.mobile));
      final result = await networkConnection.getType();
      expect(ConnectionType.mobile, result);
    });

    test('should return none if device having no internet connection',
        () async {
      when(connectivity.checkConnectivity()).thenAnswer(
          (realInvocation) => Future.value(ConnectivityResult.none));
      final result = await networkConnection.getType();
      expect(ConnectionType.none, result);
    });

    test('should throw exception if get value other than mobile, wifi or none',
        () async {
      when(connectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.other);
      expect(() => networkConnection.getType(), throwsA(isA<Exception>()));
    });
  });

  group('test cases for isConnected method', () {
    test('should return true if device has active wifi network', () async {
      when(connectivity.checkConnectivity()).thenAnswer(
          (realInvocation) => Future.value(ConnectivityResult.wifi));
      final result = await networkConnection.isConnected();
      expect(result, true);
    });

    test('should return true if device has active mobile network', () async {
      when(connectivity.checkConnectivity()).thenAnswer(
          (realInvocation) => Future.value(ConnectivityResult.mobile));
      final result = await networkConnection.isConnected();
      expect(result, true);
    });

    test('should return false if device has active mobile network', () async {
      when(connectivity.checkConnectivity()).thenAnswer(
          (realInvocation) => Future.value(ConnectivityResult.none));
      final result = await networkConnection.isConnected();
      expect(result, false);
    });

    test('should return exception if device has other active connectivity',
        () async {
      when(connectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.other);
      expect(() => networkConnection.isConnected(), throwsA(isA<Exception>()));
    });
  });

  group('test case for notifyWhenOnline method', () {
    test('should return true when notifying listeners', () {
      final result = networkConnection.notifyWhenOnline(() {});
      expect(result, true);
    });
  });
}
