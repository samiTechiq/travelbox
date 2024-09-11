import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class QuotePurchaseDetailsViewmodel extends ChangeNotifier{
  bool isSelected = false;

  void setSelected(){
    isSelected = !isSelected;
    notifyListeners();
  }
}