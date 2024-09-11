import 'package:travelbox/features/cover_quote/usecase/cover_usecase.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/questions/usecase/get_quote_usecase.dart';
import 'package:travelbox/features/quote_details/model/order_model.dart';
import 'package:travelbox/features/quote_details/usecase/order_usecase.dart';

import '../../features/cover_quote/model/country.dart';
import '../../features/cover_quote/model/cover.dart';
import '../../features/cover_quote/usecase/get_counties_usecase.dart';
import '../../features/questions/views/basic_info/usecase/basic_info_usecase.dart';

abstract class Repository {
  ///This method will login user to the server
  /// input: It will take [RegisterRequest] as input
  /// output: It will return [String] as output which will be userId if user is loggedIn successfully
  Future<String> userRegister(RegisterRequest params);

  ///This method will get offer for user
  /// input: It will take [GetCoverRequest] as input
  /// output: It will return List of [Cover] as output
  Future<List<Cover>> getCovers(GetCoverRequest params);

  ///This method will get Quote for user
  /// input: It will take [GetQuoteRequest] as input
  /// output: It will return List of [Quote] as output
  Future<List<Quote>> getQuote(GetQuoteRequest params);


  ///This method will get Order for user
  /// input: It will take [GetOrderRequest] as input
  /// output: It will return List of [OrderModel] as output
  Future<OrderModel> getOrder(GetOrderRequest params);

  ///This method will get countries for user
  /// input: It will take [GetCountriesRequest] as input
  /// output: It will return List of [CountryModel] as output
  Future<List<CountryModel>> getCountries(GetCountriesRequest params);
}
