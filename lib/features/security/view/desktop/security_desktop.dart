import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/security/viewmodel/security_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class SecurityDesktop extends StatelessWidget {
  const SecurityDesktop({super.key});

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
      appBar: GenericAppBarDesktop(
        leading: InkWell(
          onTap: () {
            sl<Navigation>().goBack(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: R.palette.mediumBlack,
          ),
        ),
        trailing: const SizedBox(),
        showLanguageIcon: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: Container(
              width: 0.368.sw,
              decoration: R.theme.genericCardDecoration,
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 35.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubHeading(
                    AppLocalizations.of(context).security,
                    color: R.palette.mediumBlack,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.h),
                  SubHeading(
                    AppLocalizations.of(context).adjust_your_security_settings,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: R.palette.lightGray,
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeading(
                              AppLocalizations.of(context).password,
                              color: R.palette.mediumBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
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
                  SizedBox(height: 25.h),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 0.188.sw,
                      height: 45.h,
                      child: GenericButton(
                        onPressed: () async {},
                        text: AppLocalizations.of(context).send_email,
                        textSize: 16,
                        fontSize: 16,
                        fontWeightT: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeading(
                              AppLocalizations.of(context).delete_account,
                              color: R.palette.mediumBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 5.h),
                            SubHeading(
                              AppLocalizations.of(context)
                                  .why_do_you_want_to_delete_your_account,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: R.palette.lightGray,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  GestureDetector(
                    onTap: () {
                      securityViewmodel.toggleIsContentOne();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.h),
                          child: SquareBox(
                            checkValue: securityViewmodel.toggleContent1,
                            // squareBoxSize: 16,
                            // iconSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Expanded(
                          child: SubHeading(
                            AppLocalizations.of(context).security_context_1,
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
                    onTap: () {
                      securityViewmodel.toggleIsContentTwo();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.h),
                          child: SquareBox(
                            checkValue: securityViewmodel.toggleContent2,
                            // squareBoxSize: 6,
                            // iconSize: 5,
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Expanded(
                          child: SubHeading(
                            AppLocalizations.of(context).security_context_2,
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
                    onTap: () {
                      securityViewmodel.toggleIsOther();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.h),
                          child: SquareBox(
                            checkValue: securityViewmodel.toggleOther,
                            // squareBoxSize: 6,
                            // iconSize: 5,
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
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
                      width: 0.188.sw,
                      height: 45.h,
                      child: GenericButton(
                        onPressed: () async {},
                        text: AppLocalizations.of(context).delete_account,
                        textSize: 16,
                        fontSize: 16,
                        fontWeightT: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 65.h,
                      width: double.infinity,
                      child: GenericButton(
                        onPressed: () async {},
                        text: AppLocalizations.of(context).save_details,
                        textSize: 18,
                        fontSize: 18,
                        fontWeightT: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
