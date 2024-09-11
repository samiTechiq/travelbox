// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentResponseImpl _$$PaymentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentResponseImpl(
      pspReference: json['pspReference'] as String,
      resultCode: json['resultCode'] as String,
      merchantReference: json['merchantReference'] as String,
    );

Map<String, dynamic> _$$PaymentResponseImplToJson(
        _$PaymentResponseImpl instance) =>
    <String, dynamic>{
      'pspReference': instance.pspReference,
      'resultCode': instance.resultCode,
      'merchantReference': instance.merchantReference,
    };
