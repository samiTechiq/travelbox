// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelbox/data/resources/r.dart';

import 'application/application.dart';
import 'data/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  configureInjectable();
  final mediaData = MediaQueryData.fromView(WidgetsBinding.instance.window)
      .copyWith(textScaler: const TextScaler.linear(kIsWeb ? 1 : 1));
  final mediaQuery = MediaQuery(data: mediaData, child: const Application());
  R.setData(mediaData);
  runApp(mediaQuery);
}
