import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/data_source/adyen/adyen_data_source.dart';
import 'package:travelbox/domain/repository/adyen_repository/adyen_repository.dart';
import 'package:travelbox/features/payment/models/payment_method_model.dart';
import 'package:travelbox/features/payment/models/payment_request.dart';
import 'package:travelbox/features/payment/models/payment_response.dart';

@LazySingleton(as: AdyenRepository)
class AdyenRepositoryImp implements AdyenRepository {
  final AdyenDataSource _adyenRemoteDataSource;

  AdyenRepositoryImp(this._adyenRemoteDataSource);

  @override
  Future<List<AvailablePaymentMethod>> getPaymentMethods(
      String merchantAccountName) async {
    final methods =
        await _adyenRemoteDataSource.getPaymentMethods(merchantAccountName);
    return methods;
  }

  @override
  Future<void> getPaymentOutcome() async {
    _adyenRemoteDataSource.getPaymentOutcome();
  }

  @override
  Future<PaymentResponse?> makePayment(PaymentRequest request) async {
    return await _adyenRemoteDataSource.makePayment(request);
  }
}
