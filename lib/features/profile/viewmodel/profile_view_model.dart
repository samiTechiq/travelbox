import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/utils/core/store/common_shared_perferences.dart';

@LazySingleton()
class ProfileViewModel extends ChangeNotifier {
  final CommonSharedPreferences commonSharedPreferences = sl<CommonSharedPreferences>();

  void signOut() async {
    await commonSharedPreferences.signOut();
  }
}
