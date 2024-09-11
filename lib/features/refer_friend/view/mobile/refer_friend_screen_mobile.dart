import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/refer_friend/widget/collapsed_eclipse.dart';
import 'package:travelbox/features/refer_friend/widget/refer_friend_card.dart';
import 'package:travelbox/features/refer_friend/widget/work_points_widget.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class ReferFriendMobile extends StatelessWidget {
  const ReferFriendMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericAppBarMobile(
                          isClickable: false,
                          leading: Padding(
                            padding: EdgeInsets.only(right: 12.w),
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
                        Row(
                          children: [
                            SizedBox(
                              width: 0.5.sw,
                              child: SubHeading(
                                AppLocalizations.of(context).txt_refer_friend_mobile,
                                fontSize: 33,
                                fontFamily: R.theme.larkenLightFontFamily,
                                fontWeight: FontWeight.w400,
                                color: R.palette.appHeadingTextBlackColor,
                              ),
                            ),
                            const Spacer(),
                            Eclipse(
                              text: "\$30".hardcoded,
                              textColor: R.palette.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 29.h,
                        ),
                        SizedBox(
                          width: 0.7.sw,
                          child: SubHeading(
                            AppLocalizations.of(context).txt_every_friend,
                            fontSize: 18,
                            maxLines: 4,
                            fontWeight: FontWeight.w500,
                            color: R.palette.darkBlack,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 0.7.sw,
                          child: SubHeading(
                            AppLocalizations.of(context).txt_link_below,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: R.palette.lightGray,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).txt_how_it_works,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: R.palette.mediumBlack,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        WorkPoints(
                          title: AppLocalizations.of(context).txt_you_share_your_link_with_a_friend,
                          index: "1".hardcoded,
                          circleSize: 27,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        WorkPoints(
                          title: AppLocalizations.of(context).txt_a_friend_buys_a_policy_using_the_link,
                          index: "2".hardcoded,
                          circleSize: 27,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        WorkPoints(
                          title: AppLocalizations.of(context).txt_your_friend_gets_a_money_discount_off_their_policy('\$30'.hardcoded),
                          index: "3".hardcoded,
                          circleSize: 27,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        WorkPoints(
                          title:
                              AppLocalizations.of(context).txt_you_instantly_get_money_refunded_off_your_policy('\$30'.hardcoded),
                          index: "4".hardcoded,
                          circleSize: 27,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).txt_referral_about_mobile,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: R.palette.dullBlack,
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        ReferFriendCard(
                          title: AppLocalizations.of(context).txt_referral_discount_link,
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        GenericButton(
                          onPressed: () {
                            sl<Navigation>()
                                .push(context, Routes.downloadSuggestRoute);
                          },
                          text: AppLocalizations.of(context).btn_next,
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
