import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/data_source/adyen/adyen_data_source.dart';
import 'package:travelbox/domain/failure/failure.dart';
import 'package:travelbox/features/payment/models/payment_method_model.dart';
import 'package:travelbox/features/payment/models/payment_request.dart';
import 'package:travelbox/features/payment/models/payment_response.dart';
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/network_call_wrapper.dart';
import 'package:travelbox/data/resources/r.dart';

@LazySingleton(as: AdyenDataSource)
class AdyenDataSourceImp extends AdyenDataSource {
  final NetworkCallsWrapper _http;

  AdyenDataSourceImp({required NetworkCallsWrapper http}) : _http = http;

  @override
  Future<List<AvailablePaymentMethod>> getPaymentMethods(
      String merchantAccountName) async {
    final apiKey = await getApiKey();
    final result = await _http.onPost(
      api: R.apiStrings.getPaymentMethodsEndPoint,
      data: {
        'merchantAccount': merchantAccountName,
      },
      headers: {
        'Content-Type': 'application/json',
        'X-API-key': apiKey,
      },
      baseUrl: R.globals.aydenBaseUrl,
    );
    if (result.statusCode != 200) {
      throw DefaultFailure(result.data['message']);
    }
    if (result.statusCode == 200) {
      final List<AvailablePaymentMethod> paymentMethods = [];
      result.data['paymentMethods'].forEach((v) {
        paymentMethods.add(AvailablePaymentMethod.fromJson(v));
      });
      return Future.value(paymentMethods);
    }
    return [];
  }

  @override
  Future<void> getPaymentOutcome() {
    // TODO: implement getPaymentOutcome
    throw UnimplementedError();
  }

  @override
  Future<PaymentResponse?> makePayment(PaymentRequest request) async {
    final apiKey = await getApiKey();
    final result = await _http.onPost(
      api: R.apiStrings.paymentEndPoint,
      data: request.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'X-API-key': apiKey,
      },
      baseUrl: R.globals.aydenBaseUrl,
    );
    if (result.statusCode != 200) {
      throw DefaultFailure(result.data['message']);
    }
    if (result.statusCode == 200) {
      final payment = PaymentResponse.fromJson(result.data);
      return Future.value(payment);
    }
    return null;
  }

  Future<String> getApiKey() async {
    final jsonString = await rootBundle.loadString('assets/secret/secret.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    return jsonMap['api_key'] as String;
  }
}
