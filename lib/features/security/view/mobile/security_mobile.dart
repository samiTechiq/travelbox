import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/security/viewmodel/security_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class SecurityMobile extends StatelessWidget {
  const SecurityMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final securityViewmodel = context.watch<SecurityViewmodel>();
    return SecurityContent(securityViewmodel: securityViewmodel);
  }
}

class SecurityContent extends StatelessWidget {
  final SecurityViewmodel securityViewmodel;

  const SecurityContent({super.key, required this.securityViewmodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
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
                height: 32.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: R.theme.genericCardDecoration,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 25.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubHeading(
                                AppLocalizations.of(context).security,
                                color: R.palette.mediumBlack,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 5.h),
                              SubHeading(
                                AppLocalizations.of(context)
                                    .adjust_your_security_settings,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: R.palette.lightGray,
                              ),
                              SizedBox(height: 27.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SubHeading(
                                          AppLocalizations.of(context).password,
                                          color: R.palette.mediumBlack,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(height: 5.h),
                                        SubHeading(
                                          AppLocalizations.of(context)
                                              .to_change_your_password,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: R.palette.lightGray,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 32.h),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 271.w,
                                  height: 60.h,
                                  child: GenericButton(
                                    onPressed: () async {},
                                    text:
                                        AppLocalizations.of(context).send_email,
                                    textSize: 12,
                                    fontSize: 16,
                                    fontWeightT: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 44.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SubHeading(
                                          AppLocalizations.of(context)
                                              .delete_account,
                                          color: R.palette.mediumBlack,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(height: 5.h),
                                        SubHeading(
                                          AppLocalizations.of(context)
                                              .why_do_you_want_to_delete_your_account,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: R.palette.lightGray,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 32.h),
                              GestureDetector(
                                onTap: () =>
                                    securityViewmodel.toggleIsContentOne(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.h),
                                      child: SquareBox(
                                        checkValue:
                                            securityViewmodel.toggleContent1,
                                        squareBoxSize: 22,
                                        iconSize: 22,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: SubHeading(
                                        AppLocalizations.of(context)
                                            .security_context_1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: R.palette.lightGray,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.h),
                              GestureDetector(
                                onTap: () =>
                                    securityViewmodel.toggleIsContentTwo(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.h),
                                      child: SquareBox(
                                        checkValue:
                                            securityViewmodel.toggleContent2,
                                        squareBoxSize: 22,
                                        iconSize: 22,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: SubHeading(
                                        AppLocalizations.of(context)
                                            .security_context_2,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: R.palette.lightGray,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.h),
                              InkWell(
                                onTap: () => securityViewmodel.toggleIsOther(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.h),
                                      child: SquareBox(
                                        checkValue:
                                            securityViewmodel.toggleOther,
                                        squareBoxSize: 22,
                                        iconSize: 22,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: SubHeading(
                                        AppLocalizations.of(context).other,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: R.palette.lightGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 32.h),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 271.w,
                                  height: 60.h,
                                  child: GenericButton(
                                    onPressed: () async {},
                                    text: AppLocalizations.of(context)
                                        .delete_account,
                                    textSize: 12,
                                    fontSize: 16,
                                    fontWeightT: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.center,
                        child: GenericButton(
                          onPressed: () {},
                          text: AppLocalizations.of(context).save_details,
                          fontSize: 18,
                          fontWeightT: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 32.h),
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
