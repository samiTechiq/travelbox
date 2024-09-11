import 'package:injectable/injectable.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/failure/failure.dart';
import 'package:travelbox/features/cover_quote/model/country.dart';
import 'package:travelbox/features/cover_quote/model/cover.dart';
import 'package:travelbox/features/cover_quote/usecase/cover_usecase.dart';
import 'package:travelbox/features/cover_quote/usecase/get_counties_usecase.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/questions/usecase/get_quote_usecase.dart';
import 'package:travelbox/features/quote_details/model/order_model.dart';
import 'package:travelbox/features/quote_details/usecase/order_usecase.dart';
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/network_call_wrapper.dart';

import '../../../domain/data_source/remote/remote_data_source.dart';
import '../../../features/questions/views/basic_info/usecase/basic_info_usecase.dart';
@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImp extends RemoteDataSource {
  final NetworkCallsWrapper _http;

  RemoteDataSourceImp({required NetworkCallsWrapper http}) : _http = http;

  @override
  Future<String> userRegister(RegisterRequest params) async {
    final result = await _http.onPost(
      api: R.apiStrings.registerEndPoint,
      data: params.toJson(),
    );
    if (result.statusCode != 200 && result.statusCode != 201) {
      throw DefaultFailure(result.data['message']);
    }
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Future.value(result.data['userId']);
    }
    return Future.error(result.data['message']);
  }

  @override
  Future<List<Cover>> getCovers(GetCoverRequest params) async {
    final result = await _http.onGet(api: R.apiStrings.offerEndPoint, headers: {
      'language': params.language,
      'country': params.country,
    });
    if (result.statusCode != 200 && result.statusCode != 201) {
      throw DefaultFailure(result.data['message']);
    }
    if (result.statusCode == 200 || result.statusCode == 201) {
      final List<Cover> covers = [];
      result.data['offers'].forEach((v) {
        covers.add(Cover.fromJson(v));
      });
      return Future.value(covers);
    }
    return [];
  }

  @override
  Future<List<Quote>> getQuote(GetQuoteRequest params) async {
    try {
      final result = await _http.onPost(
          api: R.apiStrings.quoteEndPoint,
          data: params.toJson(),
          headers: {
            'language': params.language,
            'country': params.country,
          });
      if (result.statusCode != 200 && result.statusCode != 201) {
        throw DefaultFailure(result.data['message']);
      }
      if (result.statusCode == 200 || result.statusCode == 201) {
        final List<Quote> quotes = [];
        result.data['quotes'].forEach((v) {
          quotes.add(Quote.fromJson(v));
        });
        return Future.value(quotes);
      }
      return [];
    } catch (e) {
      throw DefaultFailure('something_went_wrong');
    }
  }

  @override
  Future<OrderModel> getOrder(GetOrderRequest params) async {
    try {
      final result = await _http.onPost(
          api: R.apiStrings.orderEndPoint,
          data: params.toJson(),
          headers: {
            'language': params.language,
            'country': params.country,
          });
      if (result.statusCode != 200 && result.statusCode != 201) {
        throw DefaultFailure(result.data['message']);
      }
      if (result.statusCode == 200 || result.statusCode == 201) {
        final OrderModel order = OrderModel.fromJson(result.data);
        return Future.value(order);
      }
      return Future.value(OrderModel.initial());
    } catch (e) {
      throw DefaultFailure('something_went_wrong');
    }
  }

  @override
  Future<List<CountryModel>> getCountries(GetCountriesRequest params) async {
    try {
      final result =
          await _http.onGet(api: R.apiStrings.countriesEndPoint, headers: {
        'language': params.language,
        'country': params.country,
      });
      if (result.statusCode != 200 && result.statusCode != 201) {
        throw DefaultFailure(result.data['message']);
      }
      if (result.statusCode == 200 || result.statusCode == 201) {
        final List<CountryModel> countries = [];
        result.data.forEach((v) {
          countries.add(CountryModel.fromJson(v));
        });
        return Future.value(countries);
      }
      return Future.value([]);
    } catch (e) {
      throw DefaultFailure('something_went_wrong');
    }
  }
}
