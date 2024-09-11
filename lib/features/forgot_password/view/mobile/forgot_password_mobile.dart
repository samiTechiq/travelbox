import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:travelbox/features/forgot_password/widget/forgot_password_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class ForgotPasswordMobile extends StatefulWidget {
  const ForgotPasswordMobile({super.key});

  @override
  State<ForgotPasswordMobile> createState() => _ForgotPasswordMobileState();
}

class _ForgotPasswordMobileState extends State<ForgotPasswordMobile> {

  final viewModel = sl.get<ForgotPasswordViewModel>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<ForgotPasswordViewModel>().emailController.text =
    viewModel.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<ForgotPasswordViewModel>(),
      builder: (context, child) {
        return ForgotPasswordScreenContent(formKey: _formKey);
      },
    );
  }
}

class ForgotPasswordScreenContent extends StatelessWidget {
  const ForgotPasswordScreenContent({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: R.palette.appBackgroundColor,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GenericAppBarMobile(
                        trailing: SizedBox(
                          height: 43.h,
                          width: 43.w,
                        ),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 25.w),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: R.palette.mediumBlack,
                          ),
                        ),
                        onLeadingPressed: () {
                          sl<Navigation>().goBack(context);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ForgotPasswordCard(disableEmailValidator: false),
                    ],
                  )),
            ),
          )),
    );
  }
}
