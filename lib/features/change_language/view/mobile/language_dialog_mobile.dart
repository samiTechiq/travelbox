import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/viewmodel/change_language_viewmodel.dart';
import 'package:travelbox/features/change_language/viewmodel/generic_dropdown_item.dart';
import 'package:travelbox/features/cover_quote/model/language_data.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';

class LanguageDialogMobile extends StatefulWidget {
  const LanguageDialogMobile({super.key});

  @override
  State<LanguageDialogMobile> createState() => _LanguageDialogMobileState();
}

class _LanguageDialogMobileState extends State<LanguageDialogMobile> {
  final changeLanguageViewModel = sl<ChangeLanguageViewModel>();
  LanguageData? selected;

  @override
  void initState() {
    // changeLanguageViewModel.getLanguageName();
    // changeLanguageViewModel.getSelectedFlag();
    // selected = changeLanguageViewModel.selectedLanguage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeLanguageViewModel>.value(
        value: sl<ChangeLanguageViewModel>(),
        builder: (context, child) {
          final changeLanguageViewModel =
              context.watch<ChangeLanguageViewModel>();
          return Scaffold(
            backgroundColor: R.palette.appBackgroundColor,
            body: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    GenericAppBarMobile(
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: R.palette.mediumBlack,
                        ),
                      ),
                      onLeadingPressed: () {
                        changeLanguageViewModel.resetLanguage();
                        sl<Navigation>().goBack(context);
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: R.theme.genericCardDecoration,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            SubHeading(
                              AppLocalizations.of(context).language_title_popup,
                              color: R.palette.appHeadingTextBlackColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 5),
                            SubHeading(
                              AppLocalizations.of(context)
                                  .set_your_language_preference,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: R.palette.appGreyTextColor,
                            ),
                            const SizedBox(height: 32),
                            SubHeading(
                              AppLocalizations.of(context).select_language,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: R.palette.mediumBlack,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 60,
                              width: 321,
                              child: GenericDropDown<LanguageData>(
                                borderColor: R.palette.textFieldBorderGreyColor,
                                hintColor: R.palette.mediumBlack,
                                fillColor: R.palette.appWhiteColor,
                                hintText: changeLanguageViewModel
                                        .selectedItem?.name ??
                                    "English (UK)",
                                hintTextStyle: TextStyle(
                                  color: R.palette.mediumBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                dropDownColor: R.palette.white,
                                textColor: R.palette.appPrimaryBlue,
                                iconColor: R.palette.textFieldHintGreyColor,
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: SubHeading(
                                    AppLocalizations.of(context).change,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: R.palette.appPrimaryBlue,
                                  ),
                                ),
                                // items:
                                //     languagesData.asMap().entries.map((entry) {
                                //   return GenericDropdownItem(
                                //     flag: entry.value.flag,
                                //     name: entry.value.name,
                                //     code: entry.value.countryCode,
                                //   );
                                // }).toList(),
                                items: languagesData,
                                textStyle: TextStyle(
                                  fontFamily: R.theme.interRegular,
                                  color: R.palette.mediumBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                filled: true,
                                mapDropDownText: (value) {
                                  return GenericDropdownItem(
                                    flag: value.flag,
                                    name: value.name,
                                    code: value.countryCode,
                                  );

                                  // if (value is GenericDropdownItem) {
                                  //   return GenericDropdownItem(
                                  //     flag: value.flag,
                                  //     name: value.name,
                                  //     code: value.code,
                                  //   );
                                  // }
                                  // return const SizedBox();
                                },
                                onDropDownItemChanged: (value) {
                                  if (value != null) {
                                    changeLanguageViewModel
                                        .setSelectedFlag(value.countryCode);
                                    changeLanguageViewModel.selectedItem = value;
                                  }

                                  // if (value is GenericDropdownItem) {
                                  //   changeLanguageViewModel
                                  //       .setSelectedFlag(value.code);
                                  //   changeLanguageViewModel.selectedItem =
                                  //       value;
                                  // }
                                },
                                // value: selected,
                                // value: changeLanguageViewModel.selectedLanguage,
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 378,
                      child: GenericButton(
                        onPressed: () async {
                          changeLanguageViewModel.setSelectedLanguage(
                              changeLanguageViewModel.selectedItem
                          );

                          Locale newLocale = Locale(changeLanguageViewModel
                                  .selectedLanguage?.languageCode ??
                              "en");
                          await AppLocalizations.delegate.load(newLocale);
                          changeLanguageViewModel.setLocale(newLocale);
                          Future.delayed(Duration.zero, () {
                            sl<Navigation>().goBack(context);
                          });
                        },
                        text: AppLocalizations.of(context).save_details,
                        fontSize: 18,
                        fontWeightT: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
