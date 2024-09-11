import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'network.dart';

@LazySingleton(as: NetworkInfo)
class NetworkInfoImp implements NetworkInfo {
  final InternetConnection _connectionChecker;

  NetworkInfoImp({required InternetConnection internetConnectionChecker})
      : _connectionChecker = internetConnectionChecker;

  @override
  Future<bool> get isConnected => _connectionChecker.hasInternetAccess;
}
