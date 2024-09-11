import 'package:injectable/injectable.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/repository/adyen_repository/adyen_repository.dart';
import 'package:travelbox/domain/usecase/usecase.dart';
import 'package:travelbox/features/payment/models/payment_method_model.dart';

@LazySingleton()
class GetPaymentMethodsUseCase extends UseCase<NoParams, List<AvailablePaymentMethod>> {
  final AdyenRepository repository;

  GetPaymentMethodsUseCase(this.repository);

  @override
  Future<List<AvailablePaymentMethod>> call(NoParams input) {
    return repository.getPaymentMethods(R.globals.merchantName);
  }
}
