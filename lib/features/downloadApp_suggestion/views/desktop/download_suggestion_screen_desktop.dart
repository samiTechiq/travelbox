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

class DownLoadSuggestScreenDesktop extends StatelessWidget {
  const DownLoadSuggestScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      appBar: GenericAppBarDesktop(
        leading: InkWell(
            onTap: () {
              sl<Navigation>().goBack(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        trailing: const SizedBox(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: SizedBox(
                    width: 0.32.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).txt_time_to_download_our_mobile_app,
                          fontSize: 12,
                          fontFamily: R.theme.larkenLightFontFamily,
                          fontWeight: FontWeight.w400,
                          color: R.palette.appHeadingTextBlackColor,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        PolicyCard(
                          policyList: [
                            PolicyDetailWidget(
                              text: AppLocalizations.of(context).txt_policy_anytime,
                              iconWidth: 7,
                              bottomPadding: 35,
                              fontSize: 5.5,
                              iconTextWidth: 1.w,
                            ),
                            PolicyDetailWidget(
                              text: AppLocalizations.of(context).txt_submit_a_claim,
                              iconWidth: 7,
                              bottomPadding: 35,
                              fontSize: 5.5,
                              iconTextWidth: 1.w,
                            ),
                            PolicyDetailWidget(
                              text: AppLocalizations.of(context).txt_human_support,
                              iconWidth: 7,
                              bottomPadding: 35,
                              fontSize: 5.5,
                              iconTextWidth: 1.w,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Image.asset(
                                    R.assets.graphics.appstore.path),
                              ),
                              SizedBox(
                                width: 10.0.w,
                              ),
                              Expanded(
                                child: Image.asset(
                                    R.assets.graphics.playstore.path),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60.0.h,
                        ),
                        GenericButton(
                          onPressed: () {
                            sl<Navigation>()
                                .pushReplacement(context, Routes.homeRoute);
                          },
                          text: AppLocalizations.of(context).btn_done,
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
