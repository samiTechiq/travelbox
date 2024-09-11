import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/repository/repository.dart';
import 'package:travelbox/domain/usecase/usecase.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';

@LazySingleton()
class GetQuoteUsecase extends UseCase<GetQuoteRequest, List<Quote>> {
  final Repository repository;

  GetQuoteUsecase(this.repository);

  @override
  Future<List<Quote>> call(GetQuoteRequest input) async {
    return await repository.getQuote(input);
  }
}

class GetQuoteRequest {
  String? accountId;
  String? coverId;
  List<String>? includedCoverItemIds;
  String? coverStartDate;
  String? coverEndDate;
  String? email;
  String? mobile;
  String? countryOfResidence;
  List<PersonsToCover>? personsToCover;
  String? language;
  String? country;

  GetQuoteRequest({
    this.accountId,
    this.coverId,
    this.includedCoverItemIds,
    this.coverStartDate,
    this.coverEndDate,
    this.email,
    this.mobile,
    this.countryOfResidence,
    this.personsToCover,
    this.language,
    this.country,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountId'] = accountId;
    data['coverId'] = coverId;
    data['includedCoverItemIds'] = includedCoverItemIds;
    data['coverStartDate'] = coverStartDate;
    data['coverEndDate'] = coverEndDate;
    data['email'] = email;
    data['mobile'] = mobile;
    data['countryOfResidence'] = countryOfResidence;
    if (personsToCover != null) {
      data['personsToCover'] = personsToCover!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonsToCover {
  String? firstName;
  String? lastName;
  String? dateOfBirth;

  PersonsToCover({this.firstName, this.lastName, this.dateOfBirth});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dateOfBirth'] = dateOfBirth;
    return data;
  }
}
