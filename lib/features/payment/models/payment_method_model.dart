import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_model.freezed.dart';
part 'payment_method_model.g.dart';

@freezed
class AvailablePaymentMethod with _$AvailablePaymentMethod {
  const factory AvailablePaymentMethod({
    required String name,
    required String type,
  }) = _PaymentMethod;

  factory AvailablePaymentMethod.fromJson(Map<String, Object?> json) =>
      _$AvailablePaymentMethodFromJson(json);
}
