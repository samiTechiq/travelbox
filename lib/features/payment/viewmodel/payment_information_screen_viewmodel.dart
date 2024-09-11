import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/usecase/usecase.dart';
import 'package:travelbox/features/payment/models/payment_method_model.dart';
import 'package:travelbox/features/payment/models/payment_request.dart';
import 'package:travelbox/features/payment/usecase/get_payment_methods_usecase.dart';
import 'package:travelbox/features/payment/usecase/make_payment_usecase.dart';
import 'package:travelbox/features/payment/utils/get_card_type.dart';
import 'package:travelbox/l10n/gen/l10n.dart';

@LazySingleton()
class PaymentInformationScreenViewModel extends ChangeNotifier {
  final GetPaymentMethodsUseCase getPaymentMethods;
  final MakePaymentUsecase makePaymentUsecase;

  PaymentInformationScreenViewModel({
    required this.getPaymentMethods,
    required this.makePaymentUsecase,
  });

  String _cardNumber = '';
  String _cardHolderName = '';
  String _expiryDate = '';
  String _cvv = '';
  String _cardTypeImage = '';
  List<AvailablePaymentMethod> availableMethods = [];

  String get cardNumber => _cardNumber;

  String get cardHolderName => _cardHolderName;

  String get expiryDate => _expiryDate;

  String get cvv => _cvv;

  String get cardTypeImage => _cardTypeImage;

  void setCardNumber(String cardNumber) {
    _cardNumber = cardNumber;
    notifyListeners();
  }

  void setCardHolderName(String cardHolderName) {
    _cardHolderName = cardHolderName;
    notifyListeners();
  }

  void setExpiryDate(String expiryDate) {
    _expiryDate = expiryDate;
    notifyListeners();
  }

  void setCvv(String cvv) {
    _cvv = cvv;
    notifyListeners();
  }

  detectCardType(String ccNumStr) async {
    final type = getCardTypeFrmNumber(ccNumStr);
    switch (type) {
      case CardType.master:
        _cardTypeImage = R.assets.graphics.master.path;
        notifyListeners();
        break;
      case CardType.visa:
        _cardTypeImage = R.assets.graphics.visa.path;
        notifyListeners();
        break;
      case CardType.verve:
        _cardTypeImage = '';
        notifyListeners();

        break;
      case CardType.others:
        _cardTypeImage = '';
        notifyListeners();

        break;
      case CardType.invalid:
        _cardTypeImage = '';
        notifyListeners();

        break;
    }
  }

  Future<void> getAvailableMethods() async {
    final result = await getPaymentMethods(NoParams());
    availableMethods = result;
    notifyListeners();
  }

  Future<bool> makePayment(
      String orderId, String currency, String price) async {
    try {
      PaymentRequest request =
          makePaymentRequestModel(orderId, currency, price);
      final result = await makePaymentUsecase(request);
      if (result == null) {
        return false;
      }
      return true;
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(AppLocalizations.current.msg_error_something_went_wrong);
      return false;
    }
  }

  PaymentRequest makePaymentRequestModel(
      String orderId, String currency, String price) {
    PaymentRequest request = PaymentRequest(
      merchantAccount: R.globals.merchantName,
      paymentMethod: PaymentMethod(
        type: 'scheme',
        encryptedCardNumber: 'test_4111111111111111',
        encryptedExpiryMonth: "test_${_expiryDate.split('/')[0]}",
        encryptedExpiryYear: "test_${_expiryDate.split('/')[1]}",
        encryptedSecurityCode: 'test_$_cvv',
        // holderName: _cardHolderName,
      ),
      amount: Amount(
        currency: currency,
        value: price,
      ),
      reference: orderId,
      returnUrl: '',
    );
    return request;
  }

  bool get isValid {
    if (_cardNumber.isEmpty ||
        _cardHolderName.isEmpty ||
        _expiryDate.isEmpty ||
        _cvv.isEmpty) {
      return false;
    }

    return true;
  }

  isCardNumberValid() {
    if (_cardNumber.isEmpty || _cardNumber.length < 19) {
      return false;
    }
    return true;
  }
}
