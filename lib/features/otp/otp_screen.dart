import 'package:flutter/material.dart';
import 'package:travelbox/features/otp/view/desktop/otp_desktop_screen.dart';
import 'package:travelbox/features/otp/view/mobile/otp_mobile_screen.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: OtpMobileScreen(
          phoneNumber: phoneNumber
      ),
      desktopLayout: OtpDesktopScreen(
          phoneNumber: phoneNumber
      ),
    );
  }
}
