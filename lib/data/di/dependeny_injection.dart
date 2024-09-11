import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/di/dependeny_injection.config.dart';

final sl = GetIt.instance;

T getIt<T extends Object>([String? instanceName]) =>
    sl.get<T>(instanceName: instanceName);

@InjectableInit()
configureInjectable() {
  sl.init();
}
