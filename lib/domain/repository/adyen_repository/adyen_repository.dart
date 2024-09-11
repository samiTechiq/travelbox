import 'package:travelbox/features/payment/models/payment_method_model.dart';
import 'package:travelbox/features/payment/models/payment_request.dart';
import 'package:travelbox/features/payment/models/payment_response.dart';

abstract class AdyenRepository {
  Future<List<AvailablePaymentMethod>> getPaymentMethods(
      String merchantAccountName);

  Future<PaymentResponse?> makePayment(PaymentRequest request);

  Future<void> getPaymentOutcome();
}
