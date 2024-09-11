import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/account_settings/widget/account_settings_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class AccountSettingsDesktop extends StatelessWidget {
  const AccountSettingsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      appBar: GenericAppBarDesktop(
        leading: InkWell(
          onTap: () {
            sl<Navigation>().goBack(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: R.palette.mediumBlack,
            ),
          ),
        ),
        showLanguageIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 25.w),
          child: const AccountSettingsCard(),
        ),
      ),
    );
  }
}
