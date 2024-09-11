import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/otp/view_model/otp_viewmodel.dart';
import 'package:travelbox/features/otp/widget/otp_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class OtpDesktopScreen extends StatelessWidget {
  final String phoneNumber;
  const OtpDesktopScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<OtpViewmodel>(),
        builder: (context, index) {
          return OtpContent(phoneNumber: phoneNumber);
        });
  }
}

class OtpContent extends StatelessWidget {
  final String phoneNumber;
  const OtpContent({super.key, required this.phoneNumber});

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
        showLanguageIcon: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 25),
            child: OtpCard(phoneNumber: phoneNumber),
          ),
        ),
      ),
    );
  }
}
