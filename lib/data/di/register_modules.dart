import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';

@module
abstract class RegisterModules {
  @LazySingleton()
  Connectivity get connectivity => Connectivity();

  @LazySingleton()
  Logger get logger => Logger();

  @LazySingleton()
  InternetConnection get internetConnectionChecker => InternetConnection();
}
