import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/security/view/desktop/security_desktop.dart';
import 'package:travelbox/features/security/view/mobile/security_mobile.dart';
import 'package:travelbox/features/security/viewmodel/security_viewmodel.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<SecurityViewmodel>(),
        builder: (context, index) {
          return const ResponsiveLayout(
            mobileLayout: SecurityMobile(),
            desktopLayout: SecurityDesktop(),
          );
        });
  }
}
