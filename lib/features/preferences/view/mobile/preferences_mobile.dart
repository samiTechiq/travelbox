import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/viewmodel/change_language_viewmodel.dart';
import 'package:travelbox/features/preferences/viewmodel/preferences_viewmodel.dart';
import 'package:travelbox/features/preferences/widget/preferences_item.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/core/utils.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class PreferencesMobile extends StatefulWidget {
  final ChangeLanguageViewModel changeLanguageViewModel;

  const PreferencesMobile({super.key, required this.changeLanguageViewModel});

  @override
  State<PreferencesMobile> createState() => _PreferencesMobileState();
}

class _PreferencesMobileState extends State<PreferencesMobile> {
  @override
  void initState() {
    super.initState();
    widget.changeLanguageViewModel.getLanguageName();
    widget.changeLanguageViewModel.getSelectedFlagCode();
  }

  @override
  Widget build(BuildContext context) {
    final preferences = context.watch<PreferencesViewmodel>();
    return PreferencesContent(
      preferences: preferences,
      changeLanguageViewModel: widget.changeLanguageViewModel,
    );
  }
}

class PreferencesContent extends StatelessWidget {
  final ChangeLanguageViewModel changeLanguageViewModel;
  final PreferencesViewmodel preferences;

  const PreferencesContent(
      {super.key,
      required this.preferences,
      required this.changeLanguageViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              GenericAppBar(
                leading: Padding(
                  padding: EdgeInsets.only(right: 9.w),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: R.palette.mediumBlack,
                  ),
                ),
                onLeadingPressed: () {
                  sl<Navigation>().goBack(context);
                },
              ),
              SizedBox(
                height: 32.h,
              ),
              Container(
                decoration: R.theme.genericCardDecoration,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      SubHeading(
                        AppLocalizations.of(context).preferences,
                        color: R.palette.mediumBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 5.h),
                      SubHeading(
                        AppLocalizations.of(context).preferences_content,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: R.palette.lightGray,
                      ),
                      //Country
                      PreferencesItem(
                        flag: preferences.countryFlag,
                        data: countries,
                        title:
                            AppLocalizations.of(context).country_of_residence,
                        isCurrency: false,
                        function: preferences.setCountry,
                        titleDropdown:
                            getCountryNameFromCode(preferences.countryFlag),
                      ),
                      //Language
                      PreferencesItem(
                        flag: changeLanguageViewModel.selectedFlag,
                        data: languages,
                        title: AppLocalizations.of(context).language_profile,
                        isCurrency: false,
                        function: changeLanguageViewModel.setSelectedFlag,
                        titleDropdown: getLanguageNameFromCode(
                            changeLanguageViewModel.selectedFlag),
                      ),
                      //Currency
                      PreferencesItem(
                        flag: preferences.currencyFlag,
                        data: currencies,
                        title: AppLocalizations.of(context).currency,
                        isCurrency: true,
                        function: preferences.setCurrency,
                        titleDropdown:
                            getCurrencyFromCode(preferences.currencyFlag),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.center,
                child: GenericButton(
                  onPressed: () async {
                    Locale newLocale = Locale(getLanguageCodeFromFlag(
                        changeLanguageViewModel.selectedFlag));
                    await AppLocalizations.delegate.load(newLocale);
                    changeLanguageViewModel.setLocale(newLocale);
                  },
                  text: AppLocalizations.of(context).save_details,
                  fontSize: 18,
                  fontWeightT: FontWeight.w500,
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
