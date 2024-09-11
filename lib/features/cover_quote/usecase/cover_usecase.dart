import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/repository/repository.dart';
import 'package:travelbox/domain/usecase/usecase.dart';
import 'package:travelbox/features/cover_quote/model/cover.dart';

@LazySingleton()
class GetCoverQuoteUseCase extends UseCase<GetCoverRequest, List<Cover>> {
  final Repository repository;

  GetCoverQuoteUseCase(this.repository);

  @override
  Future<List<Cover>> call(GetCoverRequest input) {
    return repository.getCovers(input);
  }
}

class GetCoverRequest {
  final String language;
  final String country;

  GetCoverRequest({
    required this.language,
    required this.country,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetCoverRequest &&
        other.language == language &&
        other.country == country;
  }

  @override
  int get hashCode => language.hashCode ^ country.hashCode;
}
