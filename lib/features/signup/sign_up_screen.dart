import 'package:flutter/material.dart';
import 'package:travelbox/features/signup/views/desktop/sign_up_screen_desktop.dart';
import 'package:travelbox/features/signup/views/mobile/sign_up_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: SignUpScreenMobile(),
        desktopLayout: SignUpScreenDesktop());
  }
}
