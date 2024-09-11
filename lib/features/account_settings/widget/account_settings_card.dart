import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/profile/widget/profile_card_item.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class AccountSettingsCard extends StatelessWidget {
  const AccountSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: AccountSettingsCardMobile(),
      desktopLayout: AccountSettingsCardDesktop(),
    );
  }
}

class AccountSettingsCardDesktop extends StatelessWidget {
  const AccountSettingsCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 0.368.sw,
            height: 350.h,
            child: Container(
              width: double.maxFinite,
              decoration: R.theme.genericCardDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 29.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).account_settings,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: R.palette.mediumBlack,
                    ),
                    SubHeading(
                      AppLocalizations.of(context).account_settings_content,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    ProfileCardItem(
                      icon: R.assets.graphics.personDetails.path,
                      iconSize: 22.h,
                      fontSize: 16,
                      title: AppLocalizations.of(context).personal_details,
                      onPressed: () {
                        sl<Navigation>()
                            .push(context, Routes.personalDetailRoute);
                      },
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    ProfileCardItem(
                      icon: R.assets.graphics.preferences.path,
                      iconSize: 22.h,
                      fontSize: 16,
                      title: AppLocalizations.of(context).preferences,
                      onPressed: () {
                        sl<Navigation>().push(context, Routes.preferencesRoute);
                      },
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    ProfileCardItem(
                      icon: R.assets.graphics.security.path,
                      iconSize: 22.h,
                      fontSize: 16,
                      title: AppLocalizations.of(context).security,
                      onPressed: () {
                        sl<Navigation>().push(context, Routes.securityRoute);
                      },
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    ProfileCardItem(
                      icon: R.assets.graphics.notifications.path,
                      iconSize: 22.h,
                      fontSize: 16,
                      title: AppLocalizations.of(context).notifications,
                      onPressed: () {
                        sl<Navigation>()
                            .push(context, Routes.notificationsRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AccountSettingsCardMobile extends StatelessWidget {
  const AccountSettingsCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final iconSize = 25.w;
    const double fontSize = 16;
    final space = 25.h;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.maxFinite,
          decoration: R.theme.genericCardDecoration,
          child: Padding(
            padding: EdgeInsets.only(
              left: 28.w,
              right: 28.w,
              top: 30.h,
              bottom: 36.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeading(
                  AppLocalizations.of(context).account_settings,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: R.palette.lightBlack,
                ),
                SizedBox(
                  height: 5.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).account_settings_content,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: R.palette.lightGray,
                ),
                SizedBox(
                  height: space,
                ),
                ProfileCardItem(
                  icon: R.assets.graphics.personDetails.path,
                  title: AppLocalizations.of(context).personal_details,
                  onPressed: () {
                    sl<Navigation>().push(context, Routes.personalDetailRoute);
                  },
                  // onPressed: () =>
                  //     _showDialog(context, const PersonalDetailScreen()),
                  fontSize: fontSize,
                  spaceSize: 14.w,
                  iconSize: iconSize,
                ),
                SizedBox(
                  height: space,
                ),
                ProfileCardItem(
                  icon: R.assets.graphics.preferences.path,
                  title: AppLocalizations.of(context).preferences,
                  onPressed: () {
                    sl<Navigation>().push(context, Routes.preferencesRoute);
                  },
                  fontSize: fontSize,
                  spaceSize: 14.w,
                  iconSize: iconSize,
                ),
                SizedBox(
                  height: space,
                ),
                ProfileCardItem(
                  icon: R.assets.graphics.security.path,
                  title: AppLocalizations.of(context).security,
                  onPressed: () {
                    sl<Navigation>().push(context, Routes.securityRoute);
                  },
                  fontSize: fontSize,
                  spaceSize: 14.w,
                  iconSize: iconSize,
                ),
                SizedBox(
                  height: space,
                ),
                ProfileCardItem(
                  icon: R.assets.graphics.notifications.path,
                  title: AppLocalizations.of(context).notifications,
                  onPressed: () {
                    sl<Navigation>().push(context, Routes.notificationsRoute);
                  },
                  fontSize: fontSize,
                  spaceSize: 14.w,
                  iconSize: iconSize,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
