import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/language_dialog.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

import '../core/go_router/routes_constants.dart';

class GenericAppBar extends StatelessWidget {
  final VoidCallback? onLeadingPressed;
  final Widget? leading;
  final Widget? trailing;
  final Widget? center;
  final VoidCallback? onTrailingPressed;
  final Widget? centerWidget;
  final bool isClickable;
  final bool showLanguageIcon;

  const GenericAppBar({
    super.key,
    this.onTrailingPressed,
    this.leading,
    this.center,
    this.trailing,
    this.onLeadingPressed,
    this.centerWidget,
    this.isClickable = true,
    this.showLanguageIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: GenericAppBarMobile(
          onTrailingPressed: onTrailingPressed,
          onLeadingPressed: onLeadingPressed,
          leading: leading,
          trailing: trailing,
          center: center,
          centerWidget: centerWidget,
          showLanguageIcon: showLanguageIcon,
          isClickable: isClickable,
        ),
        desktopLayout: GenericAppBarDesktop(
          onTrailingPressed: onTrailingPressed,
          leading: leading,
          trailing: trailing,
          center: center,
          centerWidget: centerWidget,
          showLanguageIcon: showLanguageIcon,
          onLeadingPressed: onLeadingPressed,
        ));
  }
}

class GenericAppBarMobile extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onLeadingPressed;
  final Widget? leading;
  final Widget? trailing;
  final Widget? center;
  final VoidCallback? onTrailingPressed;
  final Widget? centerWidget;
  final bool isClickable;
  final bool showLanguageIcon;

  const GenericAppBarMobile({
    Key? key,
    this.onTrailingPressed,
    this.leading,
    this.center,
    this.trailing,
    this.onLeadingPressed,
    this.centerWidget,
    this.isClickable = true,
    this.showLanguageIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onLeadingPressed,
            child: leading ??
                Image.asset(
                  R.assets.graphics.drawer.path,
                  height: 43,
                  width: 43,
                ),
          ),
          InkWell(
            onTap: () {
              if (isClickable) {
                sl<Navigation>()
                    .pushReplacement(context, Routes.coverQuoteRoute);
              }
            },
            child: center ??
                // Align(
                //   alignment: Alignment.center,
                //   child: Container(
                //     height: 115.h,
                //     width: 128.h,
                //     decoration: BoxDecoration(
                //       color: R.palette.appPrimaryBlue,
                //       borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(120.r),
                //         bottomRight: Radius.circular(120.r),
                //       ),
                //     ),
                //     child: Center(
                //       child: Padding(
                //         padding: EdgeInsets.all(8.0.r),
                //         child: centerWidget ??
                //             GenericText(
                //               "Lyla",
                //               color: R.palette.white,
                //               fontSize: 40,
                //             ),
                //       ),
                //     ),
                //   ),
                // ),
                Center(
                  child: centerWidget ??
                      // GenericText(
                      //   "Lyla",
                      //   color: R.palette.white,
                      //   fontSize: 56.sp,
                      // ),
                      Image.asset(
                        R.assets.graphics.logo.path,
                        height: 115,
                        width: 128,
                        fit: BoxFit.contain,
                      ),
                ),
          ),
          showLanguageIcon
              ? InkWell(
                  onTap: onTrailingPressed,
                  child: SvgPicture.asset(
                    R.assets.graphics.webIcon.path,
                    height: 41,
                    width: 41,
                  ),
                )
              : InkWell(
                  onTap: onTrailingPressed,
                  child: trailing ??
                      const SizedBox(
                        height: 41,
                        width: 41,
                      ))
        ],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(115);
}

class GenericAppBarDesktop extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onTrailingPressed;
  final Widget? leading;
  final Widget? trailing;
  final Widget? center;
  final Widget? centerWidget;
  final bool isClickable;
  final bool showLanguageIcon;
  final VoidCallback? onLeadingPressed;

  const GenericAppBarDesktop(
      {Key? key,
      this.onTrailingPressed,
      this.leading,
      this.center,
      this.trailing,
      this.isClickable = true,
      this.centerWidget,
      this.showLanguageIcon = false,
      this.onLeadingPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: InkWell(
          onTap: onLeadingPressed,
          child: leading ??
              Image.asset(
                R.assets.graphics.drawer.path,
                height: 41,
                width: 41,
              ),
        ),
      ),
      centerTitle: true,
      toolbarHeight: 120,
      bottomOpacity: 0.0,
      elevation: 0.0,
      backgroundColor: R.palette.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: MouseRegion(
        cursor:
            isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: InkWell(
          onTap: () {
            if (isClickable) {
              sl<Navigation>().replace(context, Routes.coverQuoteRoute);
            }
          },
          child: center ??
              SizedBox(
                height: 110,
                width: 179,
                // decoration: BoxDecoration(
                //   color: R.palette.appPrimaryBlue,
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(280.r),
                //     bottomRight: Radius.circular(280.r),
                //     topLeft: Radius.circular(12.r),
                //     topRight: Radius.circular(12.r),
                //   ),
                // ),
                child: Center(
                  child: centerWidget ??
                      // GenericText(
                      //   "Lyla",
                      //   color: R.palette.white,
                      //   fontSize: 56.sp,
                      // ),
                      Image.asset(
                        R.assets.graphics.logo.path,
                        height: 110,
                        width: 179,
                        fit: BoxFit.contain,
                      ),
                ),
              ),
        ),
      ),
      actions: [
        showLanguageIcon
            ? SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      R.assets.graphics.webIcon.path,
                      height: 60,
                      width: 60,
                    ),
                    onPressed: onTrailingPressed,
                  ),
                ),
              )
            : trailing ?? Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(125);
}

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback? onLeadingPressed;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTrailingPressed;
  final Widget? centerWidget;
  final bool isClickable;
  final bool centerTile;

  // responsive
  final List<Widget>? mobileActions;

  final List<Widget>? desktopActions;

  final Widget? mobileLeading;

  final Widget? desktopLeading;

  final Widget? mobileCenter;

  final Widget? desktopCenter;

  final bool isLoggedIn;

  final Color? backgroundColor;

  final double? desktopLeadingWidth;

  final double? mobileLeadingWidth;

  const ResponsiveAppBar({
    super.key,
    this.onTrailingPressed,
    this.leading,
    this.trailing,
    this.onLeadingPressed,
    this.centerWidget,
    this.isClickable = true,
    this.desktopLeading,
    this.desktopActions,
    this.desktopCenter,
    this.mobileActions,
    this.mobileLeading,
    this.mobileCenter,
    this.centerTile = true,
    this.isLoggedIn = false,
    this.backgroundColor,
    this.desktopLeadingWidth,
    this.mobileLeadingWidth,
  });



  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: AppBar(
        toolbarHeight: 64,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: R.palette.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: mobileLeading,
        leadingWidth: mobileLeadingWidth,
        centerTitle: centerTile,
        title: MouseRegion(
          cursor:
              isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: InkWell(
            onTap: () {
              if (isClickable) {
                sl<Navigation>().replace(context, Routes.coverQuoteRoute);
              }
            },
            child: mobileCenter ??
                Center(
                  child: Image.asset(
                    R.assets.graphics.logo.path,
                    height: 64,
                    width: 128,
                    fit: BoxFit.contain,
                  ),
                ),
          ),
        ),
        actions: mobileActions ??
            [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: SvgPicture.asset(
                    isLoggedIn ? R.assets.graphics.person2.path : R.assets.graphics.webIcon.path,
                    height: 41,
                    width: 41,
                  ),
                  onPressed: (){
                    if(isLoggedIn){
                      sl<Navigation>().push(context, Routes.profileRoute);
                    }
                    else{
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const LanguageDialog();
                        },
                      );
                    }
                  },
                ),
              ),
            ],
      ),
      desktopLayout: AppBar(
        toolbarHeight: 120,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: backgroundColor ?? R.palette.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: desktopLeading,
        leadingWidth: desktopLeadingWidth,
        title: MouseRegion(
          cursor:
              isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: InkWell(
            onTap: () {
              if (isClickable) {
                sl<Navigation>().replace(context, Routes.coverQuoteRoute);
              }
            },
            child: desktopCenter ??
                Center(
                  child: Image.asset(
                    R.assets.graphics.logo.path,
                    height: 110,
                    width: 179,
                    fit: BoxFit.contain,
                  ),
                ),
          ),
        ),
        actions: [
          if(desktopActions?.isNotEmpty == true)
            ...desktopActions!,

          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              icon: SvgPicture.asset(
                isLoggedIn ? R.assets.graphics.person2.path : R.assets.graphics.webIcon.path,
                height: 60,
                width: 60,
              ),
              onPressed: (){
                if(isLoggedIn){
                  sl<Navigation>().push(context, Routes.profileRoute);
                }
                else{
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const LanguageDialog();
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(115);
}
