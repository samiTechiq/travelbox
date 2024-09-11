import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/utils/core/store/common_shared_perferences.dart';

@LazySingleton()
class HomeViewModel extends ChangeNotifier {
  bool? isLoggedIn;
  final CommonSharedPreferences commonSharedPreferences =
  sl<CommonSharedPreferences>();

  Future<bool?> getConfigs() async {
    isLoggedIn = await commonSharedPreferences.getLoggedIn();
    return isLoggedIn;
  }
}
