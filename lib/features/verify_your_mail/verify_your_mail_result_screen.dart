import 'package:flutter/material.dart';
import 'package:travelbox/features/verify_your_mail/view/desktop/verify_your_mail_result_screen_desktop.dart';
import 'package:travelbox/features/verify_your_mail/view/mobile/verify_your_mail_result_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class VerifyYourMailResultScreen extends StatelessWidget {
  const VerifyYourMailResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: VerifyYourMailResultScreenMobile(
            isSuccess: true
        ),
        desktopLayout: VerifyYourMailResultScreenDesktop(
          isSuccess: true
        ));
  }
}
