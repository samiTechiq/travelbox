import 'package:travelbox/domain/data_source/network_connection/network_connection.dart';
import 'package:travelbox/domain/model/connection_type/connection_type.dart';

class MockNetworkConnectionSuccess implements NetworkConnection {
  @override
  Future<ConnectionType> getType() {
    return Future.value(ConnectionType.wifi);
  }

  @override
  Future<bool> isConnected() {
    return Future.value(true);
  }

  @override
  bool notifyWhenOnline(Function callback) {
    return true;
  }
}
