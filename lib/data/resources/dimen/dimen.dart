part of '../r.dart';

class Dimen {
  final Device _device;
  final EdgeInsets screenPadding;
  final EdgeInsets viewInsets;

  Dimen._({
    required Device device,
    required this.screenPadding,
    required this.viewInsets,
  }) : _device = device;

  // region generic sizes
  double get unit0_25 => unit * 0.25;

  double get unit0_5 => unit * 0.5;

  double get unit => 8;

  double get unit1_5 => unit * 1.5;

  double get unit2 => unit * 2;

  double get unit3 => unit * 3;

  double get unit4 => unit * 4;

  double get unit5 => unit * 5;

  double get unit6 => unit * 6;

  double get unit7 => unit * 7;

  double get unit8 => unit * 8;

  double get unit9 => unit * 9;

  // endregion generic sizes

  double get keyboardHeight => viewInsets.bottom;

  double get notchHeight => screenPadding.top;

  double get statusBarHeight => screenPadding.top;

  double get bottomNotchHeight => screenPadding.bottom;

  double get screenWidth => _device.screenSize.width;

  double get screenHeight => _device.screenSize.height;

  double get toolbarHeight => (_device.isTablet && _device.isPortrait)
      ? kToolbarHeight
      : kToolbarHeight;

  double get toolbarHeightBig => toolbarHeight * 1.5;

  double get taleToolbarHeight => toolbarHeightBig + statusBarHeight;

  double get rateTaleHeight => toolbarHeight * 1.5;

  /// [toolbarHeight] + topPadding + bottomPadding
  double get bottomBarWithActionsHeight =>
      toolbarHeight + unit2 + bottomNotchHeight;

  double get screenPaddingSide => _device.isMobile ? unit2 : unit9;

  double get elevationLow => unit0_25;

  double get elevation => unit0_5;

  double get toolbarElevation => elevation;

  double get iconSize => unit3;

  double get buttonHeight => unit5;
}
