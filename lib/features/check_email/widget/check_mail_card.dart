import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/check_email/viewmodel/check_mail_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CheckMailCard extends StatelessWidget {
  final String email;
  const CheckMailCard({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: CheckMailCardMobile(email: email),
      desktopLayout: CheckMailCardDesktop(email: email),
    );
  }
}

class CheckMailCardMobile extends StatelessWidget {
  final String email;
  final viewModel = sl.get<CheckMailViewmodel>();

  CheckMailCardMobile({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubHeading(
                    AppLocalizations.of(context).check_you_email,
                    fontWeight: FontWeight.w600,
                    color: R.palette.black,
                    fontFamily: R.theme.interRegular,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).check_you_email_content,
                        color: R.palette.lightGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: R.theme.interRegular,
                      ),
                      SubHeading(
                        "cpjcollins@yahoo.co.uk",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: R.theme.interRegular,
                        color: R.palette.primaryLightBlue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  SizedBox(
                    height: 47.h,
                    child: GenericButton(
                      onPressed: () {
                        sl<Navigation>()
                            .push(context, Routes.setNewPasswordRoute);
                      },
                      text: AppLocalizations.of(context).open_mail,
                      fontSize: 18,
                      fontFamily: R.theme.interRegular,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).did_not_receive,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: R.theme.interRegular,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: SubHeading(
                          AppLocalizations.of(context).resend,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                          color: R.palette.primaryLightBlue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  InkWell(
                      child: SubHeading(
                        AppLocalizations.of(context).back_to_sign_in,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: R.palette.lightGray,
                        fontFamily: R.theme.interRegular,
                      ),
                      onTap: () {
                        sl<Navigation>().goBack(context);
                      }),
                  SizedBox(
                    height: 31.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CheckMailCardDesktop extends StatelessWidget {
  final String email;
  final viewModel = sl.get<CheckMailViewmodel>();

  CheckMailCardDesktop({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 0.368.sw,
            child: Container(
              width: double.maxFinite,
              decoration: R.theme.genericCardDecoration,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).check_you_email,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: R.palette.black,
                      fontFamily: R.theme.interRegular,
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Row(
                      children: [
                        SubHeading(
                          AppLocalizations.of(context).check_you_email_content,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: R.palette.lightGray,
                          fontFamily: R.theme.interRegular,
                        ),
                        Expanded(
                          child: SubHeading(
                            email,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: R.palette.primaryLightBlue,
                            fontFamily: R.theme.interRegular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    SizedBox(
                      width: 0.368.sw,
                      height: 65.h,
                      child: GenericButton(
                        onPressed: () {
                          sl<Navigation>()
                              .push(context, Routes.setNewPasswordRoute);
                        },
                        text: AppLocalizations.of(context).open_mail,
                        textSize: 18.h,
                        fontSize: 20,
                        fontFamily: R.theme.interRegular,
                      ),
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubHeading(
                          AppLocalizations.of(context).did_not_receive,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: R.palette.appGreyTextColor,
                          fontFamily: R.theme.interRegular,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        InkWell(
                          onTap: () {},
                          child: SubHeading(
                            AppLocalizations.of(context).resend,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: R.palette.primaryLightBlue,
                            fontFamily: R.theme.interRegular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    InkWell(
                        child: SubHeading(
                          AppLocalizations.of(context).back_to_sign_in,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: R.palette.textFieldHintGreyColor,
                          fontFamily: R.theme.interRegular,
                        ),
                        onTap: () {
                          sl<Navigation>().goBack(context);
                        }),
                    SizedBox(
                      height: 29.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
