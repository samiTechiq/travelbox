import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/set_new_password/widget/set_new_password_field_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class SetNewPasswordScreenMobile extends StatefulWidget {
  const SetNewPasswordScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<SetNewPasswordScreenMobile> createState() =>
      _SetNewPasswordScreenMobileState();
}

class _SetNewPasswordScreenMobileState
    extends State<SetNewPasswordScreenMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<BasicInfoViewModel>(),
      builder: (context, child) {
        return SetNewPasswordContent(formKey: _formKey);
      },
    );
  }
}

class SetNewPasswordContent extends StatelessWidget {
  const SetNewPasswordContent({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
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
                  children: [
                    GenericAppBarMobile(
                      trailing: SizedBox(
                        height: 41.h,
                        width: 41.w,
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
                    Container(
                      decoration: R.theme.genericCardDecoration,
                      width: 0.88.sw,
                      child: Column(
                        children: [
                          const SetNewPasswordFieldCard(),
                          SizedBox(
                            height: 14.h,
                          ),
                          GenericButton(
                            onPressed: () {
                              sl<Navigation>()
                                  .go(context, Routes.loginRoute);
                            },
                            text: AppLocalizations.of(context).reset_password,
                            fontSize: 18,
                            width: 321,
                            isEnable:
                                viewModel.confirmPassword?.isNotEmpty == true,
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: InkWell(
                                  child: SubHeading(
                                    AppLocalizations.of(context)
                                        .back_to_sign_in,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: R.palette.lightGray,
                                    fontFamily: R.theme.interRegular,
                                  ),
                                  onTap: () {
                                    sl<Navigation>().goBack(context);
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
