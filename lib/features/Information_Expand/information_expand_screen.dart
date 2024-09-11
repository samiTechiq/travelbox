import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/features/quote_details/widgets/expansion_card_page_view_data_widget.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_radio_button.dart';

class InfoExpand extends StatelessWidget {
  final bool isCruiseScreen;
  final bool isRentalProtectionScreen;
  final bool isWinterSportsProtection;
  final bool isAdventureAndSportsScreen;
  final bool isGolfCoverScreen;
  final bool isGadgetCover;
  final bool isPersonalLiabilityScreen;
  final PagesData? page;

  const InfoExpand(
      {Key? key,
      this.isCruiseScreen = false,
      this.page,
      this.isGolfCoverScreen = false,
      this.isGadgetCover = false,
      this.isWinterSportsProtection = false,
      this.isAdventureAndSportsScreen = false,
      this.isPersonalLiabilityScreen = false,
      this.isRentalProtectionScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 39.h,
                        ),
                        Container(
                          decoration: R.theme.genericCardDecoration,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 28.w, right: 16.22.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SubHeading(
                                        page?.name ?? "",
                                        fontWeight: FontWeight.w600,
                                        maxLines: 3,
                                        color: R.palette.darkBlack,
                                        fontSize: 24,
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          sl<Navigation>().goBack(context);
                                        },
                                        child: Image.asset(
                                          R.assets.graphics.cross.path,
                                          width: 18.24.w,
                                          height: 18.24.w,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Visibility(
                                    visible: isCruiseScreen,
                                    child: cruiseScreen(
                                        page?.longDescription ?? '')),
                                Visibility(
                                    visible: isRentalProtectionScreen,
                                    child: rentalVacationScreen(context),
                                ),
                                Visibility(
                                    visible: isAdventureAndSportsScreen,
                                    child: adventureSportsProtection(context),
                                ),
                                Visibility(
                                    visible: isWinterSportsProtection,
                                    child: winterSportsProtection(context),
                                ),
                                Visibility(
                                    visible: isPersonalLiabilityScreen,
                                    child: personalLiabilityScreen(context),
                                ),
                                Visibility(
                                    visible: isGolfCoverScreen,
                                    child: golfCoverScreen(context),
                                ),
                                Visibility(
                                    visible: isGadgetCover,
                                    child: gadgetCoverScreen(context),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GenericButton(
                  onPressed: () {
                    if (page?.amountText == null) {
                      sl<Navigation>().goBack(context);
                      return;
                    }
                    final price = double.parse(
                        page!.amountText!.replaceAll(RegExp('[^0-9]'), ''));
                    sl<QuoteDetailViewModel>().addToPrice(price);
                    sl<Navigation>().goBack(context);
                  },
                  text: AppLocalizations.of(context).txt_get_covered_for(page?.amountText ?? ''),
              ),
              SizedBox(
                height: 22.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cruiseScreen(String description) {
    return Column(
      children: [
        SubHeading(
          description,
          fontWeight: FontWeight.w400,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16,
          maxLines: 300,
        ),
        SizedBox(
          height: 50.h,
        )
      ],
    );
  }

  Widget rentalVacationScreen(BuildContext context) {
    return Column(
      children: [
        SubHeading(
          AppLocalizations.of(context).txt_rental_vacation,
          fontWeight: FontWeight.w400,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16,
          maxLines: 300,
        ),
        SizedBox(
          height: 461.h,
        )
      ],
    );
  }

  Widget adventureSportsProtection(BuildContext context) {
    return Column(
      children: [
        SubHeading(
          AppLocalizations.of(context).txt_adventure_sports_protection,
          fontWeight: FontWeight.w400,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16,
          maxLines: 300,
        ),
        SizedBox(
          height: 20.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 9,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Row(
                children: [
                  SubHeading(
                    "• ",
                    fontWeight: FontWeight.w400,
                    color: R.palette.textFieldHintGreyColor,
                    fontSize: 16,
                  ),
                  Expanded(
                    child: SubHeading(
                      AppLocalizations.of(context).txt_jumping_cliff,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 16,
                      maxLines: 4,
                    ),
                  )
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 36.h,
        )
      ],
    );
  }

  Widget winterSportsProtection(BuildContext context) {
    return Column(
      children: [
        SubHeading(
          AppLocalizations.of(context).txt_winter_sports,
          fontWeight: FontWeight.w400,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16,
          maxLines: 300,
        ),
        SizedBox(
          height: 20.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Row(
                children: [
                  SubHeading(
                    "• ",
                    fontWeight: FontWeight.w400,
                    color: R.palette.textFieldHintGreyColor,
                    fontSize: 16,
                  ),
                  Expanded(
                    child: SubHeading(
                      AppLocalizations.of(context).txt_skiing_and_snowboarding_in_ski_resorts,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 16,
                      maxLines: 4,
                    ),
                  )
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 32.h,
        )
      ],
    );
  }

  Widget personalLiabilityScreen(BuildContext context) {
    return Column(
      children: [
        SubHeading(
          AppLocalizations.of(context).txt_personal_liabilities_with_money('5,000,000'.hardcoded),
          fontWeight: FontWeight.w400,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16,
          maxLines: 300,
        ),
        SizedBox(
          height: 20.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Row(
                children: [
                  SubHeading(
                    "• ",
                    fontWeight: FontWeight.w400,
                    color: R.palette.textFieldHintGreyColor,
                    fontSize: 16,
                  ),
                  Expanded(
                    child: SubHeading(
                      AppLocalizations.of(context).txt_law_cost,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 16,
                      maxLines: 4,
                    ),
                  )
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 32.h,
        )
      ],
    );
  }

  Widget golfCoverScreen(BuildContext context) {
    return Column(
      children: [
        SubHeading(
          AppLocalizations.of(context).txt_benefits_of_this_cover_are_per_person_and_include,
          fontWeight: FontWeight.w400,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16,
          maxLines: 300,
        ),
        SizedBox(
          height: 20.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Row(
                children: [
                  SubHeading(
                    "• ",
                    fontWeight: FontWeight.w400,
                    color: R.palette.textFieldHintGreyColor,
                    fontSize: 16,
                  ),
                  Expanded(
                    child: SubHeading(
                      AppLocalizations.of(context).txt_cover_for_course_closure_up_to_1500,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 16,
                      maxLines: 4,
                    ),
                  )
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 32.h,
        )
      ],
    );
  }

  Widget gadgetCoverScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(
          AppLocalizations.of(context).txt_unlimited_number,
          fontWeight: FontWeight.w400,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16,
          maxLines: 300,
        ),
        SizedBox(
          height: 20.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Row(
                children: [
                  SubHeading(
                    "• ",
                    fontWeight: FontWeight.w400,
                    color: R.palette.textFieldHintGreyColor,
                    fontSize: 16,
                  ),
                  Expanded(
                    child: SubHeading(
                      AppLocalizations.of(context).txt_accidental_or_malicious_damage,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 16,
                      maxLines: 4,
                    ),
                  )
                ],
              ),
            );
          },
        ),
        SubHeading(
          AppLocalizations.of(context).txt_would_you_like_to_add_gadget_cover,
          color: R.palette.darkBlack,
          fontSize: 18,
          maxLines: 2,
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GenericRadioButton(
              title: AppLocalizations.of(context).txt_gadget_answer,
              color: R.palette.textFieldHintGreyColor,
              outerBorderColor: R.palette.checkBoxGreyColor,
              unFillBackColor: R.palette.appWhiteColor,
              checkValue: false,
              onTap: () {},
            );
          },
        ),
        SizedBox(
          height: 37.h,
        ),
      ],
    );
  }
}
