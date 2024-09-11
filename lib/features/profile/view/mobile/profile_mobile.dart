import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/profile/widget/profile_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              GenericAppBarMobile(
                leading: const SizedBox.shrink(),
                trailing: InkWell(
                  onTap: () => sl<Navigation>().goBack(context),
                  child: Icon(
                    Icons.close,
                    color: R.palette.mediumBlack,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              const ProfileCard(),
            ],
          ),
        ),
      ),
    );
  }
}
