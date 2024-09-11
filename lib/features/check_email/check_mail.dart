import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/check_email/view/desktop/check_mail_desktop.dart';
import 'package:travelbox/features/check_email/view/mobile/check_mail_mobile.dart';
import 'package:travelbox/features/check_email/viewmodel/check_mail_viewmodel.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CheckMailScreen extends StatelessWidget {
  final String email;
  const CheckMailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<CheckMailViewmodel>(),
        builder: (context, index) {
          return ResponsiveLayout(
            mobileLayout: CheckMailMobile(email:email),
            desktopLayout: CheckMailDesktop(email:email),
          );
        });
  }
}
