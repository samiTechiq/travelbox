import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/login/model/user.dart';
import 'package:travelbox/utils/core/store/common_shared_perferences.dart';

@LazySingleton()
class LoginViewmodel extends ChangeNotifier {
  final commonSharedPreferences = sl<CommonSharedPreferences>();
  bool loginState = false;
  User? user;

  void loadLogin() async {
    bool? isLoggedIn = await commonSharedPreferences.getLoggedIn() ?? false;
    User? userLogin = await commonSharedPreferences.getUser();
    loginState = isLoggedIn;
    user = userLogin;
    notifyListeners();
  }

  void setLoginState(bool value) async {
    await commonSharedPreferences.setLoggedIn(value);
    loginState = value;
    notifyListeners();
  }

  void getUser() async {
    bool? isLoggedIn = await commonSharedPreferences.getLoggedIn() ?? false;
    loginState = isLoggedIn;
    notifyListeners();
  }

  void setUser(User value) async {
    await commonSharedPreferences.setUser(value);
    user = value;
    notifyListeners();
  }
}
