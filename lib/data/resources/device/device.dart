part of '../r.dart';

double _tabletWidthBreakpoint = 600;

class Device {
  final Size screenSize;
  final Orientation orientation;
  final bool isMobile;
  final bool isTablet;

  Device._({
    required this.screenSize,
    required this.orientation,
  })  : isMobile = screenSize.shortestSide < _tabletWidthBreakpoint,
        isTablet = screenSize.shortestSide >= _tabletWidthBreakpoint;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get isLandscape => orientation == Orientation.landscape;
}
