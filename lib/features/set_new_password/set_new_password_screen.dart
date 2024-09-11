import 'package:flutter/material.dart';
import 'package:travelbox/features/set_new_password/view/desktop/set_new_password_screen_desktop.dart';
import 'package:travelbox/features/set_new_password/view/mobile/set_new_password_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: SetNewPasswordScreenMobile(),
        desktopLayout: SetNewPasswordScreenDesktop());
  }
}
