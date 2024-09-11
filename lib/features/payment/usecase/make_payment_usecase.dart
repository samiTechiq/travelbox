import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/repository/adyen_repository/adyen_repository.dart';
import 'package:travelbox/domain/usecase/usecase.dart';
import 'package:travelbox/features/payment/models/payment_request.dart';
import 'package:travelbox/features/payment/models/payment_response.dart';

@LazySingleton()
class MakePaymentUsecase extends UseCase<PaymentRequest, PaymentResponse?> {
  final AdyenRepository repository;

  MakePaymentUsecase(this.repository);

  @override
  Future<PaymentResponse?> call(PaymentRequest input) {
    return repository.makePayment(input);
  }
}
