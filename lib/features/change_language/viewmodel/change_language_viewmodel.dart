import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/cover_quote/model/language_data.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/store/common_shared_perferences.dart';

@LazySingleton()
class ChangeLanguageViewModel extends ChangeNotifier {
  final CommonSharedPreferences commonSharedPreferences =
      sl<CommonSharedPreferences>();
  String _languageName = '';
  String _selectedFlag = 'GB';
  Locale _locale = const Locale.fromSubtags(countryCode: 'GB');

  Locale get locale {
    return _locale;
  }

  String get languageName => _languageName;

  String get selectedFlag => _selectedFlag;

  LanguageData? _selectedLanguage;

  LanguageData? get selectedLanguage {
    return _selectedLanguage ?? LanguageData.enGB();
  }

  LanguageData? _selectedItem;

  LanguageData? get selectedItem => _selectedItem;

  set selectedItem(LanguageData? newItem) {
    _selectedItem = newItem;
    notifyListeners();
  }

  void setSelectedLanguage(LanguageData? languageData) {
    _selectedLanguage = languageData;
    if (languageData != null) {
      _selectedFlag = languageData.flag;
      _languageName = languageData.name;
    }
    notifyListeners();
  }

  void setLocale(Locale locale) async {
    bool localeSupport =
        AppLocalizations.delegate.supportedLocales.contains(locale);
    if (!localeSupport) return;
    _locale = locale;
    notifyListeners();
  }

  void setSelectedFlag(String code) {
    _selectedFlag = code;
    notifyListeners();
  }

  void getSelectedFlag() {
    _selectedFlag = getFlag(_selectedFlag);
  }

  void getLanguageName() {
    _languageName = getLanguageNameFormCode(_locale.languageCode);
  }

  String getFlag(String code) {
    for (LanguageData item in languagesData) {
      if (item.countryCode == code) {
        return item.flag;
      }
    }

    switch (code) {
      case 'HK':
        return '🇭🇰';
      case 'GB':
        return '🇬🇧';
      default:
        return '';
    }
  }

  String getCode(String code) {
    return code;
  }

  String getLanguageNameFormCode(String code) {
    switch (code) {
      case 'HK':
        return 'Hong Kong';
      case 'GB':
      default:
        return 'English';
    }
  }

  void getSelectedFlagCode() {
    _selectedFlag = getCode(_selectedFlag);
  }

  void resetLanguage() => _selectedItem = selectedLanguage;
}
