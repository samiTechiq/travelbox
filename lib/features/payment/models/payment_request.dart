import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_request.freezed.dart';
part 'payment_request.g.dart';

@freezed
class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    required String merchantAccount,
    required PaymentMethod paymentMethod,
    required Amount amount,
    required String reference,
    required String returnUrl,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, Object?> json) =>
      _$PaymentRequestFromJson(json);
}

@freezed
class Amount with _$Amount {
  const factory Amount({
    required String currency,
    required String value,
  }) = _Amount;

  factory Amount.fromJson(Map<String, Object?> json) => _$AmountFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String type,
    required String encryptedCardNumber,
    required String encryptedExpiryMonth,
    required String encryptedExpiryYear,
    required String encryptedSecurityCode,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, Object?> json) =>
      _$PaymentMethodFromJson(json);
}
