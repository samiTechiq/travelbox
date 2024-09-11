import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/change_language/viewmodel/change_language_viewmodel.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/app_routes.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewmodel>(
            create: (_) => sl<LoginViewmodel>()),
        ChangeNotifierProvider<ChangeLanguageViewModel>(
            create: (_) => sl<ChangeLanguageViewModel>()),
      ],
      child: ScreenUtilInit(
        designSize: _getDesignSize(context),
        builder: (BuildContext context, Widget? child) {
          context.watch<LoginViewmodel>().loadLogin();
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.2),
            child: MaterialApp.router(
              routerConfig: AppRoutes.router,
              builder: EasyLoading.init(),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.delegate.supportedLocales,
              locale: context.watch<ChangeLanguageViewModel>().locale,
            ),
          );
        },
      ),
    );
  }

  Size _getDesignSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 768) {
      // Mobile
      return const Size(428, 873);
    } else if (screenWidth < 1024) {
      // Tablet
      return const Size(768, 1024);
    } else {
      // Desktop
      return const Size(1440, 823);
    }
  }
}
