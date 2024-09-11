import 'package:travelbox/domain/model/connection_type/connection_type.dart';

abstract class NetworkConnection {
  Future<bool> isConnected();

  Future<ConnectionType> getType();

  bool notifyWhenOnline(Function callback);
}
