import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class PreferencesViewmodel extends ChangeNotifier {
  String _currencyFlag = 'HK';
  String _countryFlag = 'HK';

  String get currencyFlag => _currencyFlag;
  String get countryFlag => _countryFlag;

  void setCurrency(String code) {
    _currencyFlag = code;
    notifyListeners();
  }

  void getCurrency() {}

  void setCountry(String code) {
    _countryFlag = code;
    notifyListeners();
  }

  void getCountry() {}
}
