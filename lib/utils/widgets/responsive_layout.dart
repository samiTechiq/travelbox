import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget? tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    this.tabletLayout,
    required this.desktopLayout,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 520;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 520 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (ResponsiveLayout.isMobile(context)) {
        return mobileLayout;
      } else {
        return desktopLayout;
      }
    });
  }
}

final class ResponsiveInherited extends InheritedWidget {
  final BoxConstraints boxConstraints;

  const ResponsiveInherited({
    super.key,
    required this.boxConstraints,
    required super.child,
  });

  static ResponsiveInherited? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResponsiveInherited>();
  }

  static ResponsiveInherited of(BuildContext context) {
    final ResponsiveInherited? result = maybeOf(context);
    assert(result != null, '');
    return result!;
  }

  @override
  bool updateShouldNotify(ResponsiveInherited oldWidget) {
    return (oldWidget.boxConstraints.biggest.width < 520 &&
            boxConstraints.biggest.width >= 1200) ||
        (oldWidget.boxConstraints.biggest.width >= 1200 &&
            boxConstraints.biggest.width < 520);
  }
}
