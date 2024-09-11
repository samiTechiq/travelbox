import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  bool get isMobile => MediaQuery.sizeOf(this).width < 1000;

  bool get isDesktop => MediaQuery.sizeOf(this).width >= 1200;

  bool get isTablet =>
      MediaQuery.sizeOf(this).width >= 1000 &&
      MediaQuery.sizeOf(this).width < 1200;
}
