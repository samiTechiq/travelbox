import 'package:travelbox/domain/data_source/network_connection/network_connection.dart';
import 'package:travelbox/domain/model/connection_type/connection_type.dart';

class MockNetworkConnectionSuccess implements NetworkConnection {
  @override
  Future<ConnectionType> getType() {
    return Future.value(ConnectionType.none);
  }

  @override
  Future<bool> isConnected() {
    return Future.value(false);
  }

  @override
  bool notifyWhenOnline(Function callback) {
    return true;
  }
}
