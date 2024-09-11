import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/detail_policy/widgets/policy__detail_widget.dart';
import 'package:travelbox/features/detail_policy/widgets/policy_list_card_widget.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class DownLoadSuggestScreenMobile extends StatelessWidget {
  const DownLoadSuggestScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 0.35.sw),
                child: Heading(
                  AppLocalizations.of(context).txt_time_to_download_our_mobile_app,
                  fontSize: 32,
                  fontFamily: R.theme.larkenLightFontFamily,
                  fontWeight: FontWeight.w400,
                  color: R.palette.appHeadingTextBlackColor,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              PolicyCard(
                policyList: [
                  PolicyDetailWidget(
                      text: AppLocalizations.of(context).txt_policy_anytime,
                      iconWidth: 24,
                      bottomPadding: 24,
                      fontSize: 18,
                      iconTextWidth: 16.w),
                  PolicyDetailWidget(
                    text: AppLocalizations.of(context).txt_submit_a_claim,
                    iconWidth: 24,
                    bottomPadding: 24,
                    fontSize: 18,
                    iconTextWidth: 16.w,
                  ),
                  PolicyDetailWidget(
                    text: AppLocalizations.of(context).txt_human_support,
                    iconWidth: 24,
                    bottomPadding: 24,
                    fontSize: 18,
                    iconTextWidth: 16.w,
                  )
                ],
              ),
              SizedBox(
                height: 100.h,
                child: Row(
                  children: [
                    Expanded(
                        child: Image.asset(R.assets.graphics.appstore.path)),
                    SizedBox(
                      width: 17.82.w,
                    ),
                    Expanded(
                        child: Image.asset(R.assets.graphics.playstore.path)),
                  ],
                ),
              ),
              const Spacer(),
              GenericButton(
                onPressed: () {
                  sl<Navigation>().pushReplacement(context, Routes.onBoardingRoute);
                },
                text: AppLocalizations.of(context).btn_done,
                fontSize: 18,
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
