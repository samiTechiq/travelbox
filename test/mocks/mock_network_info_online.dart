import 'package:travelbox/domain/network/network.dart';

class MockNetworkInfoOnline implements NetworkInfo {
  @override
  Future<bool> get isConnected => Future.value(true);
}
