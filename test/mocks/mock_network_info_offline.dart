import 'package:travelbox/domain/network/network.dart';

class MockNetworkInfoOffline implements NetworkInfo {
  @override
  Future<bool> get isConnected => Future.value(false);
}
