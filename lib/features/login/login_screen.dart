import 'package:flutter/material.dart';
import 'package:travelbox/features/login/views/desktop/login_screen_desktop.dart';
import 'package:travelbox/features/login/views/mobile/login_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: LoginScreenMobile(),
        desktopLayout: LoginScreenDesktop(),
    );
  }
}
