import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/personal_detail/viewmodel/personal_detail_viewmodel.dart';
import 'package:travelbox/features/personal_detail/widget/personal_detail_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class PersonalDetailScreenMobile extends StatelessWidget {
  const PersonalDetailScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<PersonalDetailViewmodel>(),
        builder: (context, index) {
          return const PersonalDetailScreenContent();
        });
  }
}

class PersonalDetailScreenContent extends StatefulWidget {
  const PersonalDetailScreenContent({
    super.key,
  });

  @override
  State<PersonalDetailScreenContent> createState() =>
      _PersonalDetailScreenContentState();
}

class _PersonalDetailScreenContentState
    extends State<PersonalDetailScreenContent> {
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
      });
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final personalDetailViewmodel = context.watch<PersonalDetailViewmodel>();
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GenericAppBar(
                            leading: Padding(
                              padding: EdgeInsets.only(right: 12.w),
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
                            height: 32.h,
                          ),
                          PersonalDetailCard(
                            personalDetailViewmodel: personalDetailViewmodel,
                          ),
                          SizedBox(height: 35.h),
                          Align(
                            alignment: Alignment.center,
                            child: GenericButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              text: AppLocalizations.of(context).save_details,
                              fontSize: 18,
                              fontWeightT: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          if (isKeyboardVisible) ...[
                            SizedBox(height: 250.h),
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
