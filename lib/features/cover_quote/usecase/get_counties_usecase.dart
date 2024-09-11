import 'package:injectable/injectable.dart';
import 'package:travelbox/features/cover_quote/model/country.dart';

import '../../../domain/repository/repository.dart';
import '../../../domain/usecase/usecase.dart';

@LazySingleton()
class GetCountriesUsecase extends UseCase<GetCountriesRequest, List<CountryModel>> {
  final Repository repository;

  GetCountriesUsecase(this.repository);

  @override
  Future<List<CountryModel>> call(GetCountriesRequest input) async {
    return await repository.getCountries(input);
  }
}

class GetCountriesRequest {
  final String language;
  final String country;

  GetCountriesRequest({required this.language, required this.country});
}
