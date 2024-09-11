// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentRequestImpl _$$PaymentRequestImplFromJson(Map<String, dynamic> json) =>
    _$PaymentRequestImpl(
      merchantAccount: json['merchantAccount'] as String,
      paymentMethod:
          PaymentMethod.fromJson(json['paymentMethod'] as Map<String, dynamic>),
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      reference: json['reference'] as String,
      returnUrl: json['returnUrl'] as String,
    );

Map<String, dynamic> _$$PaymentRequestImplToJson(
        _$PaymentRequestImpl instance) =>
    <String, dynamic>{
      'merchantAccount': instance.merchantAccount,
      'paymentMethod': instance.paymentMethod.toJson(),
      'amount': instance.amount.toJson(),
      'reference': instance.reference,
      'returnUrl': instance.returnUrl,
    };

_$AmountImpl _$$AmountImplFromJson(Map<String, dynamic> json) => _$AmountImpl(
      currency: json['currency'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$AmountImplToJson(_$AmountImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'value': instance.value,
    };

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      type: json['type'] as String,
      encryptedCardNumber: json['encryptedCardNumber'] as String,
      encryptedExpiryMonth: json['encryptedExpiryMonth'] as String,
      encryptedExpiryYear: json['encryptedExpiryYear'] as String,
      encryptedSecurityCode: json['encryptedSecurityCode'] as String,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'encryptedCardNumber': instance.encryptedCardNumber,
      'encryptedExpiryMonth': instance.encryptedExpiryMonth,
      'encryptedExpiryYear': instance.encryptedExpiryYear,
      'encryptedSecurityCode': instance.encryptedSecurityCode,
    };
