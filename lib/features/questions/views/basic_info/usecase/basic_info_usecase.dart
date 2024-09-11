import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/repository/repository.dart';
import 'package:travelbox/domain/usecase/usecase.dart';

@LazySingleton()
class BasicInfoUsecase extends UseCase<RegisterRequest, String> {
  final Repository repository;

  BasicInfoUsecase(this.repository);

  @override
  Future<String> call(RegisterRequest input) {
    return repository.userRegister(input);
  }
}

class RegisterRequest {
  final String title;
  final String firstName;
  final String surname;
  final String email;
  final String mobile;
  final String countryCodeOfResidence;
  final String password;

  RegisterRequest({
    required this.title,
    required this.firstName,
    required this.surname,
    required this.email,
    required this.mobile,
    required this.countryCodeOfResidence,
    required this.password,
  });

  toJson() => {
        "title": title,
        "firstName": firstName,
        "surname": surname,
        "email": email,
        "mobile": mobile,
        "countryCodeOfResidence": countryCodeOfResidence,
        "password": password,
      };

  @override
  int get hashCode =>
      title.hashCode ^
      firstName.hashCode ^
      surname.hashCode ^
      email.hashCode ^
      mobile.hashCode ^
      countryCodeOfResidence.hashCode ^
      password.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterRequest &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          firstName == other.firstName &&
          surname == other.surname &&
          email == other.email &&
          mobile == other.mobile &&
          countryCodeOfResidence == other.countryCodeOfResidence &&
          password == other.password;
}
