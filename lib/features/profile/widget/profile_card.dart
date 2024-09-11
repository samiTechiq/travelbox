import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/network/network.dart';
import 'package:travelbox/features/change_language/language_dialog.dart';
import 'package:travelbox/features/profile/viewmodel/profile_view_model.dart';
import 'package:travelbox/features/profile/widget/profile_card_item.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<ProfileViewModel>(),
        builder: (context, index) {
          return const ResponsiveLayout(
            mobileLayout: ProfileCardMobile(),
            desktopLayout: ProfileCardDesktop(),
          );
        });
  }
}

class ProfileCardDesktop extends StatelessWidget {
  const ProfileCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProfileViewModel>();
    final iconSize = 25.w;
    const double fontSize = 16;
    final space = 25.h;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: 0.368.sw,
            child: Container(
              width: double.maxFinite,
              decoration: R.theme.genericCardDecoration,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 28.w,
                  right: 28.w,
                  top: 32.h,
                  bottom: 60.h,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeading(
                              'Chris Collins'.hardcoded,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: R.palette.mediumBlack,
                            ),
                            SubHeading(
                              'cpjcollins@yahoo.com'.hardcoded,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w400,
                              color: R.palette.lightGray,
                            ),
                          ],
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            R.assets.graphics.person2.path,
                            height: 39.w,
                            width: 39.w,
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ProfileCardItem(
                      icon: R.assets.graphics.person.path,
                      iconSize: iconSize,
                      title: AppLocalizations.of(context).manage_account,
                      fontSize: fontSize,
                      onPressed: () async {
                        if (!await sl<NetworkInfo>().isConnected) {
                          Future.delayed(Duration.zero, () {
                            EasyLoading.showError(AppLocalizations.of(context).msg_error_no_internet_connection);
                          });
                          return;
                        }
                        Future.delayed(Duration.zero, () {
                          sl<Navigation>().push(
                            // ignore: use_build_context_synchronously
                            context,
                            Routes.accountSettingsRoute,
                          );
                        });
                      },
                    ),
                    SizedBox(
                      height: space,
                    ),
                    ProfileCardItem(
                      icon: R.assets.graphics.quote.path,
                      title: AppLocalizations.of(context).get_a_quote,
                      fontSize: fontSize,
                      iconSize: iconSize,
                      onPressed: () async {
                        if (!await sl<NetworkInfo>().isConnected) {
                          Future.delayed(Duration.zero, () {
                            EasyLoading.showError(AppLocalizations.of(context).msg_error_no_internet_connection);
                          });
                          return;
                        }
                        Future.delayed(Duration.zero, () {
                          sl<Navigation>().push(
                            // ignore: use_build_context_synchronously
                            context,
                            Routes.coverQuoteRoute,
                          );
                        });
                      },
                    ),
                    SizedBox(
                      height: space,
                    ),
                    ProfileCardItem(
                      icon: R.assets.graphics.language.path,
                      title: AppLocalizations.of(context).language_profile,
                      fontSize: fontSize,
                      iconSize: iconSize,
                      onPressed: () => {
                        sl<Navigation>()
                            .push(context, Routes.changeLanguageRoute)
                      },
                    ),
                    SizedBox(
                      height: space,
                    ),
                    ProfileCardItem(
                      icon: R.assets.graphics.signOut.path,
                      title: AppLocalizations.of(context).sign_out,
                      fontSize: fontSize,
                      iconSize: iconSize,
                      onPressed: () {
                        viewModel.signOut();
                        sl<Navigation>().push(context, Routes.onBoardingRoute);
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

class ProfileCardMobile extends StatelessWidget {
  const ProfileCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProfileViewModel>();
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
            padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 29.h, bottom: 38.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeading(
                          'Chris Collins'.hardcoded,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: R.palette.mediumBlack,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SubHeading(
                          'cpjcollins@yahoo.com'.hardcoded,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w400,
                          color: R.palette.lightGray,
                        ),
                      ],
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        R.assets.graphics.person2.path,
                        height: 39.h,
                        width: 39.h,
                      ),
                      onTap: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: space,
                ),
                ProfileCardItem(
                  icon: R.assets.graphics.person.path,
                  title: AppLocalizations.of(context).manage_account,
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                      sl<Navigation>().push(
                        // ignore: use_build_context_synchronously
                        context,
                        Routes.accountSettingsRoute,
                      );
                    });
                  },
                  fontSize: fontSize,
                  spaceSize: 14.w,
                  iconSize: iconSize,
                ),
                SizedBox(
                  height: space
                ),
                ProfileCardItem(
                  icon: R.assets.graphics.quote.path,
                  title: AppLocalizations.of(context).get_a_quote,
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                      sl<Navigation>().push(
                        // ignore: use_build_context_synchronously
                        context,
                        Routes.coverQuoteRoute,
                      );
                    });
                  },
                  fontSize: fontSize,
                  spaceSize: 14.w,
                  iconSize: iconSize,
                ),
                SizedBox(
                  height: space,
                ),
                ProfileCardItem(
                  icon: R.assets.graphics.language.path,
                  title: AppLocalizations.of(context).language_profile,
                  onPressed: () => _showDialog(context, const LanguageDialog()),
                  fontSize: fontSize,
                  spaceSize: 14.w,
                  iconSize: iconSize,
                ),
                SizedBox(
                  height: space,
                ),
                ProfileCardItem(
                  icon: R.assets.graphics.signOut.path,
                  title: AppLocalizations.of(context).sign_out,
                  onPressed: () {
                    viewModel.signOut();
                    sl<Navigation>().push(context, Routes.onBoardingRoute);
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

Future<void> _showDialog(BuildContext context, Widget dialog) async {
  return showDialog<void>(
    context: context,
    barrierColor: const Color.fromARGB(1, 255, 255, 255),
    barrierDismissible: false,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
