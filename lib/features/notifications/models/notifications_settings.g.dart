// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsSettings _$NotificationsSettingsFromJson(
        Map<String, dynamic> json) =>
    NotificationsSettings(
      promotions: json['promotions'] as bool,
      rewards: json['rewards'] as bool,
      referFriend: json['referFriend'] as bool,
      productService: json['productService'] as bool,
      customerFeedback: json['customerFeedback'] as bool,
      productAnno: json['productAnno'] as bool,
      travelExp: json['travelExp'] as bool,
      purchasesEmails: json['purchasesEmails'] as bool,
      renewals: json['renewals'] as bool,
      reviews: json['reviews'] as bool,
      offersConfirmEmail: json['offersConfirmEmail'] as bool,
      purchaseConfirmEmail: json['purchaseConfirmEmail'] as bool,
    );

Map<String, dynamic> _$NotificationsSettingsToJson(
        NotificationsSettings instance) =>
    <String, dynamic>{
      'promotions': instance.promotions,
      'rewards': instance.rewards,
      'referFriend': instance.referFriend,
      'productService': instance.productService,
      'customerFeedback': instance.customerFeedback,
      'productAnno': instance.productAnno,
      'travelExp': instance.travelExp,
      'purchasesEmails': instance.purchasesEmails,
      'renewals': instance.renewals,
      'reviews': instance.reviews,
      'offersConfirmEmail': instance.offersConfirmEmail,
      'purchaseConfirmEmail': instance.purchaseConfirmEmail,
    };
