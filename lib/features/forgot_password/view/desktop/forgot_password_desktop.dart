import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:travelbox/features/forgot_password/widget/forgot_password_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class ForgotPasswordDesktop extends StatefulWidget {
  const ForgotPasswordDesktop({super.key});

  @override
  State<ForgotPasswordDesktop> createState() => _ForgotPasswordDesktopState();
}

class _ForgotPasswordDesktopState extends State<ForgotPasswordDesktop> {
  final viewModel = sl.get<ForgotPasswordViewModel>();

  @override
  void initState() {
    context.read<ForgotPasswordViewModel>().emailController.text =
        viewModel.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      appBar: GenericAppBarDesktop(
        leading: Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Icon(
            Icons.arrow_back_ios,
            color: R.palette.mediumBlack,
          ),
        ),
        onLeadingPressed: () {
          sl<Navigation>().goBack(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 25),
          child: ForgotPasswordCard(disableEmailValidator: false),
        ),
      ),
    );
  }
}
