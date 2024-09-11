import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/viewmodel/change_language_viewmodel.dart';
import 'package:travelbox/features/change_language/viewmodel/generic_dropdown_item.dart';
import 'package:travelbox/features/cover_quote/model/language_data.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/core/utils.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';

class ChangeLanguageDesktop extends StatefulWidget {
  const ChangeLanguageDesktop({super.key});

  @override
  State<ChangeLanguageDesktop> createState() => _ChangeLanguageDesktopState();
}

class _ChangeLanguageDesktopState extends State<ChangeLanguageDesktop> {
  final changeLanguageViewModel = sl<ChangeLanguageViewModel>();

  @override
  void initState() {
    changeLanguageViewModel.getLanguageName();
    changeLanguageViewModel.getSelectedFlag();
    changeLanguageViewModel.getSelectedFlagCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      appBar: GenericAppBarDesktop(
        leading: InkWell(
          onTap: () {
            sl<Navigation>().goBack(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: R.palette.mediumBlack,
          ),
        ),
        showLanguageIcon: false,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.h,
            ),
            SizedBox(
              width: 0.368.sw,
              child: Container(
                width: double.maxFinite,
                decoration: R.theme.genericCardDecoration,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 32.h, horizontal: 28.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).language_title_popup,
                        color: R.palette.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 5.h),
                      SubHeading(
                        AppLocalizations.of(context)
                            .set_your_language_preference,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(height: 25.h),
                      SubHeading(
                        AppLocalizations.of(context).select_language,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 47.h,
                        child: GenericDropDown<LanguageData>(
                          borderColor: R.palette.textFieldBorderGreyColor,
                          hintColor: R.palette.mediumBlack,
                          fillColor: R.palette.appWhiteColor,
                          hintText: getLanguageNameFromFlag(
                              changeLanguageViewModel.selectedFlag),
                          hintTextStyle: TextStyle(
                            color: R.palette.mediumBlack,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          dropDownColor: R.palette.appWhiteColor,
                          textColor: R.palette.appPrimaryBlue,
                          iconColor: R.palette.textFieldHintGreyColor,
                          icon: Text(
                            "${AppLocalizations.of(context).change}   ",
                            style: TextStyle(
                              color: R.palette.appPrimaryBlue,
                              fontSize: 14.sp,
                            ),
                          ),
                          // items: languagesData.asMap().entries.map((entry) {
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
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
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
                            // }
                          },
                        ),
                      ),
                      SizedBox(height: 45.h),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: double.infinity,
                          height: 65.h,
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
                            text: "Save",
                            fontSize: 20,
                            fontWeightT: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
