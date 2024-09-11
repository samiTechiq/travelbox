// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/extension/extension.dart';
import 'package:travelbox/domain/failure/failure.dart';
import 'package:travelbox/features/cover_quote/model/country.dart';
import 'package:travelbox/features/cover_quote/model/country_data.dart';
import 'package:travelbox/features/cover_quote/model/cover.dart';
import 'package:travelbox/features/cover_quote/usecase/cover_usecase.dart';
import 'package:travelbox/l10n/gen/l10n.dart';

import '../../../utils/core/go_router/app_routes.dart';
import '../usecase/get_counties_usecase.dart';

enum AvailableCoversTimeFrame { annual, single, none }

enum DestinationRegionAnnual { asia, world, none }

@LazySingleton()
class CoverQuoteViewModel extends ChangeNotifier {
  final GetCoverQuoteUseCase getCoverQuoteUseCase;
  final GetCountriesUsecase getCountriesUseCase;

  // List<Cover>? _coverList = [];
  //
  // List<CountryModel> _countryList = [];

  late final List<Cover> _coverList;
  List<CountryData> _countryList = [];
  List<Map<String, dynamic>> _countries = [];

  bool isLoading = true;

  CountryData selectedCountry = CountryData(
    'Hong Kong',
    code: 'HK',
    flag: '🇭🇰',
  );

  AvailableCoversTimeFrame timeframeSelected = AvailableCoversTimeFrame.single;
  bool isSingleTripSelected = false;
  Cover selectedCover = Cover.initial();
  List<AvailableCoverItems> selectedCheckBox = [];
  String? destinationToCover;
  DestinationRegionAnnual destinationRegionAnnual =
      DestinationRegionAnnual.none;

  // List<Cover> get coverList => _coverList ?? [];

  // List<CountryModel> get countryList => _countryList;

  List<Cover> get coverList => _coverList;
  List<CountryData> get countryList => _countryList;
  List<Map<String, dynamic>> get countries => _countries;

  CoverQuoteViewModel(
      {required this.getCoverQuoteUseCase, required this.getCountriesUseCase});

  Future<List<Map<String, dynamic>>> loadCountriesJson() async {
    String data = await rootBundle.loadString('assets/data/countries.json');
    final jsonResult = jsonDecode(data);
    return List.from(jsonResult);
  }

  void getCoverQuote(String language, String country) async {
    try {
      final List<Cover> result;
      if (kDebugMode) {
        String data = await rootBundle.loadString('assets/data/covers.json');
        final jsonResult = jsonDecode(data);
        result = [];
        jsonResult.forEach((v) {
          result.add(Cover.fromJson(v));
        });
      } else {
        result = await getCoverQuoteUseCase(
            GetCoverRequest(language: language, country: country));
      }
      _coverList = result;
      isLoading = false;
      notifyListeners();
    } on NoInternetException catch (_) {
      navigatorKey.currentState!.context.showSnackBar(
          AppLocalizations.current.msg_error_no_internet_connection);
    } catch (e) {
      // navigatorKey.currentState!.context
      //     .showSnackBar(R.stringRes.errorString.somethingWentWrong);
    }
  }

  void getCountries(String language, String country) async {
    try {
      final List<CountryModel> result;
      if (kDebugMode) {
        String data =
            await rootBundle.loadString('assets/data/countries_cover.json');
        final jsonResult = jsonDecode(data);
        result = [];
        jsonResult.forEach((v) {
          result.add(CountryModel.fromJson(v));
        });
      } else {
        result = await getCountriesUseCase(
            GetCountriesRequest(language: language, country: country));
      }
      _countryList = [];
      _countries = [];
      _countries = await loadCountriesJson();
      _countries.map((entry) {
        CountryModel? country = result.firstWhereOrNull(
            (country) => country.countryCode == entry['code']);
        if (country != null) {
          CountryData data = CountryData(
            entry['name'],
            code: entry['code'],
            image: entry['image'],
            flag: entry['emoji'],
          );
          _countryList.add(data);
        }
      }).toList();
      notifyListeners();
    } on NoInternetException catch (_) {
      navigatorKey.currentState!.context.showSnackBar(
          AppLocalizations.current.msg_error_no_internet_connection);
    } catch (e) {
      // navigatorKey.currentState!.context
      //     .showSnackBar(R.stringRes.errorString.somethingWentWrong);
    }
  }

  setDestinationRegionAnnual(DestinationRegionAnnual region) {
    destinationRegionAnnual = region;
    notifyListeners();
  }

  setCover(Cover cover) {
    selectedCover = cover;
    if (cover.name == '') {
      timeframeSelected = AvailableCoversTimeFrame.none;
      notifyListeners();
      return;
    }
    if (cover.name!.contains('Annual')) {
      timeframeSelected = AvailableCoversTimeFrame.annual;
    } else {
      timeframeSelected = AvailableCoversTimeFrame.single;
    }
    notifyListeners();
  }

  setCountry(CountryData data) {
    selectedCountry = data;
    notifyListeners();
  }

  setCheckBox(AvailableCoverItems checkBox) {
    if (checkBox.isSelected) {
      selectedCheckBox.add(checkBox);
    }
    notifyListeners();
  }

  setDestination(String destination) {
    destinationToCover = destination;
    notifyListeners();
  }
}
