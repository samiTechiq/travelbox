import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class PolicyConfirmViewModel extends ChangeNotifier {
  bool confirmAbove = false;
  bool acceptPolicy = false;

  void setConfirmAbove() {
    confirmAbove = !confirmAbove;
    notifyListeners();
  }

  void setAcceptPolicy() {
    acceptPolicy = !acceptPolicy;
    notifyListeners();
  }

  bool isButtonEnabled() => confirmAbove && acceptPolicy;
}
