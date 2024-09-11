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

class SetNewPasswordScreenDesktop extends StatefulWidget {
  const SetNewPasswordScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<SetNewPasswordScreenDesktop> createState() =>
      _SetNewPasswordScreenDesktopState();
}

class _SetNewPasswordScreenDesktopState
    extends State<SetNewPasswordScreenDesktop> {
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
      width: 0.368.sw,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          appBar: GenericAppBarDesktop(
            leading: InkWell(
              onTap: () {
                sl<Navigation>().goBack(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: R.palette.mediumBlack,
                ),
              ),
            ),
            trailing: const SizedBox(),
            showLanguageIcon: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 37.h),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 0.368.sw,
                decoration: R.theme.genericCardDecoration,
                child: Padding(
                  padding: EdgeInsets.only(left:28.w, right: 28.w, top: 35.h),
                  child: Form(
                      key: _formKey,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SetNewPasswordFieldCard(),
                            GenericButton(
                              onPressed: () {
                                sl<Navigation>().go(context, Routes.loginRoute);
                              },
                              text: AppLocalizations.of(context).reset_password,
                              fontSize: 20,
                              height: 47.h,
                              width: 0.368.sw,
                              isEnable:
                                  viewModel.confirmPassword?.isNotEmpty == true,
                            ),
                            SizedBox(
                              height: 33.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                  child: SubHeading2(
                                    AppLocalizations.of(context)
                                        .back_to_sign_in,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: R.palette.textFieldHintGreyColor,
                                    fontFamily: R.theme.interRegular,
                                  ),
                                  onTap: () {
                                    sl<Navigation>().goBack(context);
                                  }),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
