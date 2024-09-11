import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/data_source/remote/remote_data_source.dart';
import 'package:travelbox/domain/repository/repository.dart';
import 'package:travelbox/features/cover_quote/model/country.dart';
import 'package:travelbox/features/cover_quote/model/cover.dart';
import 'package:travelbox/features/cover_quote/usecase/cover_usecase.dart';
import 'package:travelbox/features/cover_quote/usecase/get_counties_usecase.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/questions/usecase/get_quote_usecase.dart';
import 'package:travelbox/features/quote_details/model/order_model.dart';
import 'package:travelbox/features/quote_details/usecase/order_usecase.dart';
import '../../domain/failure/failure.dart';
import '../../domain/network/network.dart';
import '../../features/questions/views/basic_info/usecase/basic_info_usecase.dart';

@LazySingleton(as: Repository)
class RepositoryImp extends Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImp({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<String> userRegister(RegisterRequest params) async {
    if (!await networkInfo.isConnected) {
      throw NoInternetException('No Internet');
    }
    return remoteDataSource.userRegister(params);
  }

  @override
  Future<List<Cover>> getCovers(GetCoverRequest params) async {
    if (!await networkInfo.isConnected) {
      throw NoInternetException('No Internet');
    }
    return remoteDataSource.getCovers(params);
  }

  @override
  Future<List<Quote>> getQuote(GetQuoteRequest params) async {
    if (!await networkInfo.isConnected) {
      throw NoInternetException('No Internet');
    }
    return remoteDataSource.getQuote(params);
  }

  @override
  Future<OrderModel> getOrder(GetOrderRequest params) async {
    if (!await networkInfo.isConnected) {
      throw NoInternetException('No Internet');
    }
    return remoteDataSource.getOrder(params);
  }

  @override
  Future<List<CountryModel>> getCountries(GetCountriesRequest params) async {
    if (!await networkInfo.isConnected) {
      throw NoInternetException('No Internet');
    }
    return remoteDataSource.getCountries(params);
  }
}
