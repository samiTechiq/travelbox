import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/forgot_password/view/desktop/forgot_password_desktop.dart';
import 'package:travelbox/features/forgot_password/view/mobile/forgot_password_mobile.dart';
import 'package:travelbox/features/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<ForgotPasswordViewModel>(),
        builder: (context, index) {
          return const ResponsiveLayout(
            mobileLayout: ForgotPasswordMobile(),
            desktopLayout: ForgotPasswordDesktop(),
          );
        });
  }
}
