import 'package:flutter/material.dart';
import 'package:travelbox/features/change_language/view/desktop/language_dialog_desktop.dart';
import 'package:travelbox/features/change_language/view/mobile/language_dialog_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: LanguageDialogMobile(),
      desktopLayout: LanguageDialogDesktop(),
    );
  }
}
