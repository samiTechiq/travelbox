import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SecurityViewmodel extends ChangeNotifier {
  bool toggleContent1 = false;
  bool toggleContent2 = false;
  bool toggleOther = false;

  void toggleIsContentOne() {
    toggleContent1 = !toggleContent1;
    notifyListeners();
  }

  void toggleIsContentTwo() {
    toggleContent2 = !toggleContent2;
    notifyListeners();
  }

  void toggleIsOther () {
    toggleOther = !toggleOther;
    notifyListeners();
  }
}