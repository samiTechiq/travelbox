import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.freezed.dart';
part 'country.g.dart';

@unfreezed
class CountryModel with _$CountryModel {
  factory CountryModel({
    String? countryName,
    String? countryCode,
    @Default(false) bool isSelected,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  factory CountryModel.initial() =>
      CountryModel(countryName: '', countryCode: '');
}

