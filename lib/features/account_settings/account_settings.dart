import 'package:flutter/material.dart';
import 'package:travelbox/features/account_settings/view/desktop/account_settings_desktop.dart';
import 'package:travelbox/features/account_settings/view/mobile/account_settings_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: AccountSettingsMobile(),
      desktopLayout: AccountSettingsDesktop(),
    );
  }
}
