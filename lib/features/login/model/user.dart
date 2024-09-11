import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.initial() =>
      const User(email: '', firstName: '', lastName: '', phoneNumber: '');

  @override
  Map<String, dynamic> toJson() {
    return toJson();
  }
}
