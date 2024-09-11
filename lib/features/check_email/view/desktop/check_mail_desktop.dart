import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/check_email/widget/check_mail_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class CheckMailDesktop extends StatelessWidget {
  final String email;
  const CheckMailDesktop({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GenericAppBarDesktop(
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
            CheckMailCard(email: email),
          ],
        ),
      ),
    );
  }
}
