import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ExpansionCardBot extends StatelessWidget {
  const ExpansionCardBot({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: ExpansionCardMobile(),
      desktopLayout: ExpansionCardDesktop(),
    );
  }
}

class ExpansionCardMobile extends StatelessWidget {
  const ExpansionCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(R.assets.graphics.bkgQuotePurchaseBotMb.path),
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(
            AppLocalizations.of(context).trip_coverage_details,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: R.palette.appHeadingTextBlackColor,
          ),
          SizedBox(
            height: 15.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).name,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                    SubHeading(
                      "Christopher Collins (35 yrs)",
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).policy,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                    SubHeading(
                      "Asian superior travel insurance",
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).plan,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                    SubHeading(
                      "Plan B",
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).destination,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                    SubHeading(
                      "ThaiLand",
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).policy_start_date,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                    SubHeading(
                      "Oct 10, 2024",
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).policy_end_date,
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                    SubHeading(
                      "Oct 17, 2024",
                      fontWeight: FontWeight.w400,
                      color: R.palette.textFieldHintGreyColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).downloads,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: R.palette.mediumBlack,
                  fontFamily: R.theme.larkenLightFontFamily,
                ),
                SizedBox(
                  height: 12.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).benefits_schedule,
                  fontWeight: FontWeight.w500,
                  color: R.palette.appPrimaryBlue,
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                  decorationColor: R.palette.appPrimaryBlue,
                  decorationThickness: 2,
                ),
                SizedBox(
                  height: 12.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).policy_wording,
                  fontWeight: FontWeight.w500,
                  color: R.palette.appPrimaryBlue,
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                  decorationColor: R.palette.appPrimaryBlue,
                  decorationThickness: 2,
                ),
                SizedBox(
                  height: 12.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).covid_19_extension,
                  fontWeight: FontWeight.w500,
                  color: R.palette.appPrimaryBlue,
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                  decorationColor: R.palette.appPrimaryBlue,
                  decorationThickness: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}

class ExpansionCardDesktop extends StatelessWidget {
  const ExpansionCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(R.assets.graphics.bkgQuotePurchaseBot.path),
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(
            AppLocalizations.of(context).trip_coverage_details,
            fontSize: 7,
            fontWeight: FontWeight.w600,
            color: R.palette.appHeadingTextBlackColor,
          ),
          SizedBox(
            height: 15.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).name,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                    SubHeading(
                      "Christopher Collins (35 yrs)",
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).policy,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                    SubHeading(
                      "Asian superior travel insurance",
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).plan,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                    SubHeading(
                      "Plan B",
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).destination,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                    SubHeading(
                      "ThaiLand",
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).policy_start_date,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                    SubHeading(
                      "Oct 10, 2024",
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).policy_end_date,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                    SubHeading(
                      "Oct 17, 2024",
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      fontSize: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).downloads,
                  fontSize: 7,
                  fontWeight: FontWeight.w400,
                  color: R.palette.mediumBlack,
                  fontFamily: R.theme.larkenLightFontFamily,
                ),
                SizedBox(
                  height: 3.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).benefits_schedule,
                  fontWeight: FontWeight.w500,
                  color: R.palette.appPrimaryBlue,
                  fontSize: 5,
                  decoration: TextDecoration.underline,
                  decorationColor: R.palette.appPrimaryBlue,
                  decorationThickness: 2,
                ),
                SizedBox(
                  height: 3.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).policy_wording,
                  fontWeight: FontWeight.w500,
                  color: R.palette.appPrimaryBlue,
                  fontSize: 5,
                  decoration: TextDecoration.underline,
                  decorationColor: R.palette.appPrimaryBlue,
                  decorationThickness: 2,
                ),
                SizedBox(
                  height: 3.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).covid_19_extension,
                  fontWeight: FontWeight.w500,
                  color: R.palette.appPrimaryBlue,
                  fontSize: 5,
                  decoration: TextDecoration.underline,
                  decorationColor: R.palette.appPrimaryBlue,
                  decorationThickness: 2,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
