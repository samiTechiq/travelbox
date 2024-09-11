import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/profile/widget/profile_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class ProfileDesktop extends StatelessWidget {
  const ProfileDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      appBar: GenericAppBarDesktop(
        leading: const SizedBox.shrink(),
        trailing: Padding(
          padding: EdgeInsets.only(right: 67.w),
          child: IconButton(
            icon: const Icon(Icons.close,),
            color: R.palette.mediumBlack,
            onPressed: () {
              sl<Navigation>().goBack(context);
          },
          ),
        ),
        showLanguageIcon: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 25),
            child: const ProfileCard(),
          ),
        ),
      ),
    );
  }
}
