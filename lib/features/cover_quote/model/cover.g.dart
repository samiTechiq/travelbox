// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoverImpl _$$CoverImplFromJson(Map<String, dynamic> json) => _$CoverImpl(
      coverId: json['coverId'] as String,
      availableCoverItems: (json['availableCoverItems'] as List<dynamic>)
          .map((e) => AvailableCoverItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      shortDescription: json['shortDescription'] as String?,
      startingPrice:
          StartingPrice.fromJson(json['startingPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CoverImplToJson(_$CoverImpl instance) =>
    <String, dynamic>{
      'coverId': instance.coverId,
      'availableCoverItems':
          instance.availableCoverItems.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'startingPrice': instance.startingPrice.toJson(),
    };

_$StartingPriceImpl _$$StartingPriceImplFromJson(Map<String, dynamic> json) =>
    _$StartingPriceImpl(
      amount: json['amount'] as num,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$StartingPriceImplToJson(_$StartingPriceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };

_$AvailableCoverItemsImpl _$$AvailableCoverItemsImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableCoverItemsImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$AvailableCoverItemsImplToJson(
        _$AvailableCoverItemsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'isSelected': instance.isSelected,
    };
