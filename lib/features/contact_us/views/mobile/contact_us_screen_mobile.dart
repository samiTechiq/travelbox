import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/copyright_bottom.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class ContactUsScreenMobile extends StatelessWidget {
  const ContactUsScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GenericAppBarMobile(
                trailing: Padding(
                  padding: EdgeInsets.only(right: 22.w),
                  child: InkWell(
                    onTap: () {
                      sl<Navigation>().goBack(context);
                    },
                    child: Image.asset(
                      R.assets.graphics.cross.path,
                      width: 23,
                      height: 23,
                    ),
                  ),
                ),
                leading: const SizedBox(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: SubHeading(
                          AppLocalizations.of(context).lbl_contact_us,
                          fontSize: 32,
                          fontFamily: R.theme.larkenLightFontFamily,
                          fontWeight: FontWeight.w400,
                          color: R.palette.appHeadingTextBlackColor,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Container(
                          width: double.infinity,
                          decoration: R.theme.genericCardDecoration,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 32.h, bottom: 54.h, left: 23.w, right: 23.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubHeading(
                                  AppLocalizations.of(context).lbl_contact_us_2,
                                  fontSize: 22,
                                  fontFamily: R.theme.larkenLightFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      R.assets.graphics.imgContactUs.path,
                                      height: 221.h,
                                      width: 332.w,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 20.h,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Heading(
                                      AppLocalizations.of(context)
                                          .lbl_contact_us_phone,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color:
                                      R.palette.appHeadingTextBlackColor,
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    SubHeading(
                                      AppLocalizations.of(context)
                                          .lbl_contact_us_monday_friday,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color:
                                      R.palette.appHeadingTextBlackColor,
                                    ),
                                    SubHeading(
                                      AppLocalizations.of(context)
                                          .lbl_contact_us_9_6,
                                      fontSize: 16,
                                      color:
                                      R.palette.appHeadingTextBlackColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: R.theme.genericTextStyle,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: AppLocalizations.of(
                                                  context)
                                                  .lbl_contact_us_international,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                  R.theme.interRegular,
                                                  fontSize: 16,
                                                  color: R.palette
                                                      .appHeadingTextBlackColor)),
                                          TextSpan(
                                              text: '+852 90843237',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  fontFamily:
                                                  R.theme.interRegular,
                                                  color: R.palette
                                                      .appPrimaryBlue),
                                              recognizer:
                                              TapGestureRecognizer()
                                                ..onTap = () {}),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Image.asset(
                                  R.assets.graphics.imgContactUs2.path,
                                  height: 221.h,
                                  width: 332.w,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Heading(
                                  AppLocalizations.of(context)
                                      .lbl_contact_us_email,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .lbl_contact_us_pre_trip,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                InkWell(
                                  child: SubHeading(
                                    'support@withlyla.com',
                                    fontSize: 16,
                                    color: R.palette.appPrimaryBlue,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 22.h,
                                ),
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .lbl_contact_us_for_claims,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                InkWell(
                                  child: SubHeading(
                                    'claims@withlyla.com',
                                    fontSize: 16,
                                    color: R.palette.appPrimaryBlue,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 22.h,
                                ),
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .lbl_contact_us_advisors,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                InkWell(
                                  child: SubHeading(
                                    'advisors@withlyla.com',
                                    fontSize: 16,
                                    color: R.palette.appPrimaryBlue,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 22.h,
                                ),
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .lbl_contact_us_partnership,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                InkWell(
                                  child: SubHeading(
                                    'partners@withlyla.com',
                                    fontSize: 16,
                                    color: R.palette.appPrimaryBlue,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      const CopyRightBottom(),
                    ],

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
