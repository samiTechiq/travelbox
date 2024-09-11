import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/notifications/models/notifications_settings.dart';
import 'package:travelbox/utils/core/store/common_shared_perferences.dart';

@LazySingleton()
class NotificationsViewmodel extends ChangeNotifier {
  NotificationsSettings _notificationsSettings = notificationsSettingsConst;
  NotificationsSettings get notificationsSettings => _notificationsSettings;
  final CommonSharedPreferences commonSharedPreferences =
      sl<CommonSharedPreferences>();

  void getConfigs() async {
    _notificationsSettings = NotificationsSettings(
      promotions: await commonSharedPreferences.getPromotions() ??
          notificationsSettingsConst.promotions,
      rewards: await commonSharedPreferences.getRewards() ??
          notificationsSettingsConst.rewards,
      referFriend: await commonSharedPreferences.getReferFriend() ??
          notificationsSettingsConst.referFriend,
      productService: await commonSharedPreferences.getProductService() ??
          notificationsSettingsConst.productService,
      customerFeedback: await commonSharedPreferences.getCustomerFeedback() ??
          notificationsSettingsConst.customerFeedback,
      productAnno: await commonSharedPreferences.getProductAnno() ??
          notificationsSettingsConst.productAnno,
      travelExp: await commonSharedPreferences.getTravelExp() ??
          notificationsSettingsConst.travelExp,
      purchasesEmails: await commonSharedPreferences.getPurchasesEmails() ??
          notificationsSettingsConst.purchasesEmails,
      renewals: await commonSharedPreferences.getRenewals() ??
          notificationsSettingsConst.renewals,
      reviews: await commonSharedPreferences.getReviews() ??
          notificationsSettingsConst.reviews,
      offersConfirmEmail:
          await commonSharedPreferences.getOffersConfirmEmail() ??
              notificationsSettingsConst.offersConfirmEmail,
      purchaseConfirmEmail:
          await commonSharedPreferences.getPurchaseConfirmEmail() ??
              notificationsSettingsConst.purchaseConfirmEmail,
    );
    notifyListeners();
  }

  void setRewards(bool value) {
    _notificationsSettings.rewards = value;
    commonSharedPreferences.setRewards(_notificationsSettings.rewards);
    notifyListeners();
  }

  void setReviews(bool value) {
    _notificationsSettings.reviews = value;
    commonSharedPreferences.setReviews(_notificationsSettings.reviews);
    notifyListeners();
  }

  void setOffersConfirmEmail(bool value) {
    _notificationsSettings.offersConfirmEmail = value;
    commonSharedPreferences
        .setOffersConfirmEmail(_notificationsSettings.offersConfirmEmail);
    notifyListeners();
  }

  void setCustomerFeedback(bool value) {
    _notificationsSettings.customerFeedback = value;
    commonSharedPreferences
        .setCustomerFeedback(_notificationsSettings.customerFeedback);
    notifyListeners();
  }

  void setRenewals(bool value) {
    _notificationsSettings.renewals = value;
    commonSharedPreferences.setRenewals(_notificationsSettings.renewals);
    notifyListeners();
  }

  void setPurchasesEmails(bool value) {
    _notificationsSettings.purchasesEmails = value;
    commonSharedPreferences
        .setPurchasesEmails(_notificationsSettings.purchasesEmails);
    notifyListeners();
  }

  void setProductAnno(bool value) {
    _notificationsSettings.productAnno = value;
    commonSharedPreferences.setProductAnno(_notificationsSettings.productAnno);
    notifyListeners();
  }

  void setProductService(bool value) {
    _notificationsSettings.productService = value;
    commonSharedPreferences
        .setProductService(_notificationsSettings.productService);
    notifyListeners();
  }

  void setPromotions(bool value) {
    _notificationsSettings.promotions = value;
    commonSharedPreferences.setPromotions(_notificationsSettings.promotions);
    notifyListeners();
  }

  void setPurchaseConfirmEmail(bool value) {
    _notificationsSettings.purchaseConfirmEmail = value;
    commonSharedPreferences
        .setPurchaseConfirmEmail(_notificationsSettings.purchaseConfirmEmail);
    notifyListeners();
  }

  void setReferFriend(bool value) {
    _notificationsSettings.referFriend = value;
    commonSharedPreferences.setReferFriend(_notificationsSettings.referFriend);
    notifyListeners();
  }

  void setTravelExp(bool value) {
    _notificationsSettings.travelExp = value;
    commonSharedPreferences.setTravelExp(_notificationsSettings.travelExp);
    notifyListeners();
  }
}
