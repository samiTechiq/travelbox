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

class ReferFriendDesktop extends StatelessWidget {
  const ReferFriendDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: GenericAppBarDesktop(
                      leading: InkWell(
                          onTap: () {
                            sl<Navigation>().goBack(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      trailing: const SizedBox(),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 0.32.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              // width: 0.17.sw,
                              child: Heading(
                                AppLocalizations.of(context).txt_refer_friend_desktop,
                                fontSize: 11,
                                fontFamily: R.theme.larkenLightFontFamily,
                                fontWeight: FontWeight.w800,
                                color: R.palette.appHeadingTextBlackColor,
                              ),
                            ),
                            const Spacer(),
                            Eclipse(
                              text: "\$30".hardcoded,
                              totalSize: 28,
                              circleSize: 25,
                              fontSize: 8,
                              textColor: R.palette.mediumBlack,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).txt_every_friend,
                          fontSize: 5.5,
                          maxLines: 4,
                          fontWeight: FontWeight.w600,
                          color: R.palette.mediumBlack,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).txt_link_below,
                          fontSize: 5,
                          fontWeight: FontWeight.w400,
                          color: R.palette.lightGray,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).txt_how_it_works,
                          fontSize: 6,
                          color: R.palette.darkBlack,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        WorkPoints(
                          title: AppLocalizations.of(context).txt_you_share_your_link_with_a_friend,
                          index: "1".hardcoded,
                          fontSize: 5,
                          circleSize: 8,
                          iconTextSpace: 3,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        WorkPoints(
                          title: AppLocalizations.of(context).txt_a_friend_buys_a_policy_using_the_link,
                          index: "2".hardcoded,
                          fontSize: 5,
                          circleSize: 8,
                          iconTextSpace: 3,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        WorkPoints(
                          title: AppLocalizations.of(context).txt_your_friend_gets_a_money_discount_off_their_policy('\$30'.hardcoded),
                          index: "3".hardcoded,
                          fontSize: 5,
                          circleSize: 8,
                          iconTextSpace: 3,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        WorkPoints(
                          title:
                          AppLocalizations.of(context).txt_you_instantly_get_money_refunded_off_your_policy('\$30'.hardcoded),
                          index: "4".hardcoded,
                          fontSize: 5,
                          iconTextSpace: 3,
                          circleSize: 8,
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).txt_referral_about_desktop,
                          fontSize: 5,
                          fontWeight: FontWeight.w600,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
