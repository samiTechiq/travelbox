import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_settings.g.dart';

@JsonSerializable()
class NotificationsSettings {
  bool promotions;
  bool rewards;
  bool referFriend;
  bool productService;
  bool customerFeedback;
  bool productAnno;
  bool travelExp;
  bool purchasesEmails;
  bool renewals;
  bool reviews;
  bool offersConfirmEmail;
  bool purchaseConfirmEmail;

  NotificationsSettings(
     {
    required this.promotions,
       required this.rewards,
       required  this.referFriend,
       required this.productService,
       required this.customerFeedback,
       required this.productAnno,
       required this.travelExp,
       required this.purchasesEmails,
       required this.renewals,
       required  this.reviews,
       required this.offersConfirmEmail,
       required  this.purchaseConfirmEmail,
  });

  factory NotificationsSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsSettingsToJson(this);
}
