// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:travelbox/data/const/const_data.dart';

String getCountryNameFromFlag(String flag) {
  return countries.firstWhereOrNull((country) => country.flag == flag)?.name ??
      '';
}

String getCurrencyFromFlag(String flag) {
  return currencies
          .firstWhereOrNull((country) => country.flag == flag)
          ?.currency ??
      '';
}

String getLanguageNameFromFlag(String flag) {
  return languages.firstWhereOrNull((country) => country.flag == flag)?.name ??
      '';
}

String getLanguageCodeFromFlag(String flag) {
  return languages.firstWhereOrNull((country) => country.flag == flag)?.code ??
      'en';
}

String getLanguageNameFromCode(String code) {
  return languages.firstWhereOrNull((country) => country.code == code)?.name ??
      '';
}

String getCountryNameFromCode(String code) {
  return countries.firstWhereOrNull((country) => country.code == code)?.name ??
      '';
}

String getCurrencyFromCode(String code) {
  return currencies
      .firstWhereOrNull((country) => country.code == code)
      ?.currency ??
      '';
}