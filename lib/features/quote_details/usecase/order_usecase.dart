import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/repository/repository.dart';
import 'package:travelbox/domain/usecase/usecase.dart';

import '../model/order_model.dart';

@LazySingleton()
class GetOrderUsecase extends UseCase<GetOrderRequest, OrderModel> {
  final Repository repository;

  GetOrderUsecase(this.repository);

  @override
  Future<OrderModel> call(GetOrderRequest input) async {
    return await repository.getOrder(input);
  }
}

class GetOrderRequest {
  final String language;
  final String country;
  final String quoteId;

  GetOrderRequest(
      {required this.language, required this.country, required this.quoteId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quoteId'] = quoteId;
    return data;
  }
}
