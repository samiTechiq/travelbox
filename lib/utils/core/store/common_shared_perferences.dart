import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/login/model/user.dart';
import 'package:travelbox/utils/core/store/sdk_shared_preferences_impl.dart';

@LazySingleton()
class CommonSharedPreferences {
  final SDKSharedPreferencesImpl sharedPreferences = sl<SDKSharedPreferencesImpl>();

  Future<void> setLocale(String locale) {
    return sharedPreferences.setString('locale', locale);
  }

  Future<String?> getLocale() {
    return sharedPreferences.getString('locale');
  }

  Future<void> setLoggedIn(bool isLoggedIn) {
    return sharedPreferences.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool?> getLoggedIn() {
    return sharedPreferences.getBool('isLoggedIn');
  }

  Future<void> setNotificationsSettings(String data) {
    return sharedPreferences.setString('notifications_settings', data);
  }

  Future<String?> getNotificationsSettings() {
    return sharedPreferences.getString('notifications_settings');
  }

  Future<void> setRewards(bool data) {
    return sharedPreferences.setBool('rewards', data);
  }

  Future<bool?> getRewards() {
    return sharedPreferences.getBool('rewards');
  }

  Future<void> setReviews(bool data) {
    return sharedPreferences.setBool('reviews', data);
  }

  Future<bool?> getReviews() {
    return sharedPreferences.getBool('reviews');
  }

  Future<void> setOffersConfirmEmail(bool data) {
    return sharedPreferences.setBool('offers_confirm_email', data);
  }

  Future<bool?> getOffersConfirmEmail() {
    return sharedPreferences.getBool('offers_confirm_email');
  }

  Future<void> setCustomerFeedback(bool data) {
    return sharedPreferences.setBool('customer_feedback', data);
  }

  Future<bool?> getCustomerFeedback() {
    return sharedPreferences.getBool('customer_feedback');
  }

  Future<void> setRenewals(bool data) {
    return sharedPreferences.setBool('renewals', data);
  }

  Future<bool?> getRenewals() {
    return sharedPreferences.getBool('renewals');
  }

  Future<void> setPurchasesEmails(bool data) {
    return sharedPreferences.setBool('purchases_emails', data);
  }

  Future<bool?> getPurchasesEmails() {
    return sharedPreferences.getBool('purchases_emails');
  }

  Future<void> setProductAnno(bool data) {
    return sharedPreferences.setBool('productAnno', data);
  }

  Future<bool?> getProductAnno() {
    return sharedPreferences.getBool('productAnno');
  }

  Future<void> setProductService(bool data) {
    return sharedPreferences.setBool('product_service', data);
  }

  Future<bool?> getProductService() {
    return sharedPreferences.getBool('product_service');
  }

  Future<void> setPromotions(bool data) {
    return sharedPreferences.setBool('promotions', data);
  }

  Future<bool?> getPromotions() {
    return sharedPreferences.getBool('promotions');
  }

  Future<void> setPurchaseConfirmEmail(bool data) {
    return sharedPreferences.setBool('purchase_confirm_email', data);
  }

  Future<bool?> getPurchaseConfirmEmail() {
    return sharedPreferences.getBool('purchase_confirm_email');
  }

  Future<void> setReferFriend(bool data) {
    return sharedPreferences.setBool('refer_a_friend', data);
  }

  Future<bool?> getReferFriend() {
    return sharedPreferences.getBool('refer_a_friend');
  }

  Future<void> setTravelExp(bool data) {
    return sharedPreferences.setBool('travel_exp', data);
  }

  Future<bool?> getTravelExp() {
    return sharedPreferences.getBool('travel_exp');
  }

  Future<void> setUser(User user) {
    return sharedPreferences.setString('user', jsonEncode(user));
  }

  Future<User?> getUser() async {
    User? user;
    String? userString = await sharedPreferences.getString('user');
    if (userString != null) {
      user = User.fromJson(jsonDecode(userString));
    }
    return user;
  }

  Future<void> signOut() async {
    await sharedPreferences.remove('isLoggedIn');
    await sharedPreferences.remove('user');
  }
}
