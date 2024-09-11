import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/personal_detail/viewmodel/personal_detail_viewmodel.dart';
import 'package:travelbox/features/personal_detail/widget/personal_detail_card.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class PersonalDetailScreenDesktop extends StatelessWidget {
  const PersonalDetailScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<PersonalDetailViewmodel>(),
        builder: (context, index) {
          return PersonalDetailScreenContent();
        });
  }
}

class PersonalDetailScreenContent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  PersonalDetailScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final personalDetailViewmodel = context.watch<PersonalDetailViewmodel>();
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GenericAppBarDesktop(
                  leading: InkWell(
                    onTap: () {
                      sl<Navigation>().goBack(context);
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: 25.w),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: R.palette.mediumBlack,
                      ),
                    ),
                  ),
                  trailing: const SizedBox(),
                  showLanguageIcon: false,
                ),
                SizedBox(
                  height: 25.h,
                ),
                PersonalDetailCard(
                  personalDetailViewmodel: personalDetailViewmodel,
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
