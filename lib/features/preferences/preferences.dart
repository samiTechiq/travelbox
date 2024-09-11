import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/change_language/viewmodel/change_language_viewmodel.dart';
import 'package:travelbox/features/preferences/view/desktop/preferences_desktop.dart';
import 'package:travelbox/features/preferences/view/mobile/preferences_mobile.dart';
import 'package:travelbox/features/preferences/viewmodel/preferences_viewmodel.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changeLanguageViewModel = context.watch<ChangeLanguageViewModel>();
    return ChangeNotifierProvider.value(
        value: sl<PreferencesViewmodel>(),
        builder: (context, index) {
          return ResponsiveLayout(
            mobileLayout: PreferencesMobile(
                changeLanguageViewModel: changeLanguageViewModel),
            desktopLayout: PreferencesDesktop(
                changeLanguageViewModel: changeLanguageViewModel),
          );
        });
  }
}
