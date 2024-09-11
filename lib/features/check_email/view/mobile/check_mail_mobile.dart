import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/check_email/widget/check_mail_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class CheckMailMobile extends StatelessWidget {
  final String email;
  const CheckMailMobile({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: R.palette.appBackgroundColor,
            body: SingleChildScrollView(
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GenericAppBarMobile(
                    leading: Padding(
                      padding: EdgeInsets.only(left: 25.w),
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
                    height: 27.h,
                  ),
                  Container(
                    decoration: R.theme.genericCardDecoration,
                    width: 0.88.sw,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 28.w, right: 28.w, top: 30.h),
                      child: Column(
                        children: [
                          CheckMailCard(email: email),
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
          )),
    );
  }
}
