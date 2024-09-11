// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';

import '../mocks/navigator_mock.dart';

final navigatorObserverMock = MockNavigatorObserver();

extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize(
      {double width = 480,
      double height = 965,
      double pixelDensity = 1}) async {
    final size = Size(width, height);
    await binding.setSurfaceSize(size);
    binding.window.physicalSizeTestValue = size;
    binding.window.devicePixelRatioTestValue = pixelDensity;
  }

  Future<void> setResources() async {
    final mediaData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    await R.setData(mediaData);
  }

  Future testAppForWidgetTesting(Widget child,
      {Duration duration = Duration.zero}) async {
    final mediaData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    final mediaQuery = MediaQuery(
      data: mediaData,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: sl<LoginViewmodel>(),
          )
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: ScreenUtilInit(
                designSize: const Size(480, 965),
                builder: (_, __) {
                  return child;
                }),
          ),
          navigatorObservers: [navigatorObserverMock],
        ),
      ),
    );

    return pumpWidget(mediaQuery, duration: duration);
  }
}
