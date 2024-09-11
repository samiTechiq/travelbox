import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';

class LanguageDialogDesktop extends StatefulWidget {
  const LanguageDialogDesktop({super.key});

  @override
  State<LanguageDialogDesktop> createState() => _LanguageDialogDesktopState();
}

class _LanguageDialogDesktopState extends State<LanguageDialogDesktop> {
  // final changeLanguageViewModel = sl<ChangeLanguageViewModel>();

  @override
  void initState() {
    // changeLanguageViewModel.getLanguageName();
    // changeLanguageViewModel.getSelectedFlag();
    // changeLanguageViewModel.getSelectedFlagCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeLanguageViewModel>.value(
      value: sl<ChangeLanguageViewModel>(),
      builder: (context, child) {
        final changeLanguageViewModel =
            context.watch<ChangeLanguageViewModel>();
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 15.h),
            child: SizedBox(
              width: (624 / 1440).sw,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        changeLanguageViewModel.resetLanguage();
                        sl<Navigation>().goBack(context);
                      },
                      child: Image.asset(
                        R.assets.graphics.cross.path,
                        height: 13,
                      ),
                    ),
                  ),
                  Heading(
                    AppLocalizations.of(context).language_title_popup,
                    color: R.palette.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: R.theme.interRegular,
                  ),
                  SizedBox(height: 3),
                  SubHeading(
                    AppLocalizations.of(context).set_your_language_preference,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: R.palette.textFieldHintGreyColor,
                  ),
                  SizedBox(height: 25.h),
                  SubHeading(
                    AppLocalizations.of(context).select_language,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: R.palette.mediumBlack,
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 47.h,
                    child: GenericDropDown<LanguageData>(
                      borderColor: R.palette.textFieldBorderGreyColor,
                      hintColor: R.palette.mediumBlack,
                      fillColor: R.palette.appWhiteColor,
                      hintText: changeLanguageViewModel.selectedItem?.name ??
                          "English (UK)",
                      hintTextStyle: TextStyle(
                        color: R.palette.mediumBlack,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      dropDownColor: R.palette.appWhiteColor,
                      textColor: R.palette.appPrimaryBlue,
                      iconColor: R.palette.textFieldHintGreyColor,
                      icon: Text(
                        AppLocalizations.of(context).change,
                        style: TextStyle(
                          color: R.palette.appPrimaryBlue,
                          fontSize: 17.sp,
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
                        fontSize: 17.sp,
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
                        //   changeLanguageViewModel.selectedItem = value;
                        // }
                      },
                      // value: changeLanguageViewModel.selectedItem,
                    ),
                  ),
                  SizedBox(height: 45),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 378.w,
                      height: 58.h,
                      child: GenericButton(
                        onPressed: () async {
                          changeLanguageViewModel.setSelectedLanguage(
                              changeLanguageViewModel.selectedItem);
                          Locale newLocale = Locale(
                            changeLanguageViewModel
                                    .selectedLanguage?.languageCode ??
                                "en-gb",
                          );
                          await AppLocalizations.delegate.load(newLocale);
                          changeLanguageViewModel.setLocale(newLocale);
                          Future.delayed(Duration.zero, () {
                            sl<Navigation>().goBack(context);
                          });
                        },
                        text: AppLocalizations.of(context).save_details,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
