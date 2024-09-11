import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/account_settings/widget/account_settings_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class AccountSettingsMobile extends StatelessWidget {
  const AccountSettingsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              GenericAppBarMobile(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      const AccountSettingsCard(),
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
