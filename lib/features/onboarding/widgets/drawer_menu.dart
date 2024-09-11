import 'package:flutter/material.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: DrawerMenuMobile(),
      desktopLayout: DrawerMenuDesktop(),
    );
  }
}

class DrawerMenuDesktop extends StatelessWidget {
  const DrawerMenuDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class DrawerMenuMobile extends StatelessWidget {
  const DrawerMenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      appBar: GenericAppBarMobile(
        trailing: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(
            Icons.close,
            color: R.palette.mediumBlack,
          ),
        ),
        leading: const SizedBox.shrink(),
        onTrailingPressed: () {
          sl<Navigation>().goBack(context);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 1,
              color: R.palette.textFieldBorderGreyColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 230,
                    child: InkWell(
                      onTap: () {
                        sl<Navigation>().push(context, Routes.contactUsRoute);
                      },
                      child: Text(
                        'Contact us'.hardcoded,
                        style: TextStyle(
                          fontSize: 18,
                          color: R.palette.appHeadingTextBlackColor,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 230,
                    child: InkWell(
                      onTap: () {
                        sl<Navigation>().push(context, Routes.signUpRoute);
                      },
                      child: Text(
                        'Sign up'.hardcoded,
                        style: TextStyle(
                          fontSize: 18,
                          color: R.palette.appHeadingTextBlackColor,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton.outline(
                    onPressed: () {
                      sl<Navigation>().push(context, Routes.loginRoute);
                    },
                    width: 135,
                    height: 50,
                    borderColor: R.palette.appPrimaryBlue,
                    color: R.palette.white,
                    text: 'Sign in'.hardcoded,
                    fontSize: 18,
                    fontWeightT: FontWeight.w500,
                    textColor: R.palette.appPrimaryBlue,
                    fontFamily: R.theme.interRegular,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton.generic(
                    onPressed: () {
                      sl<Navigation>().push(context, Routes.coverQuoteRoute);
                    },
                    width: 249,
                    height: 50,
                    color: R.palette.appPrimaryBlue,
                    text: AppLocalizations.of(context).check_pricing,
                    fontSize: 18,
                    fontWeightT: FontWeight.w500,
                    textColor: R.palette.white,
                    fontFamily: R.theme.interRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
