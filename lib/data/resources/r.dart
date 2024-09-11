import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/domain/value_objects/png_asset_graphics.dart';

part 'device/device.dart';

part 'dimen/dimen.dart';

part 'space/space.dart';

part 'palette/palette.dart';

part 'assets/assets.dart';

part 'string/string_res.dart';

part 'theme/theme.dart';

part 'string/globals.dart';

part 'string/api_strings.dart';

class R {
  R._();

  static late Device _device;
  static late Dimen _dimen;
  static late Spaces _space;
  static late Palette _palette;
  static late Assets _assets;
  static final StringRes _stringRes = StringRes();
  static late Themes _theme;
  static late GlobalStrings _globalStrings;
  static late ApiStrings _apiStrings;

  /// will be called first
  static Future<bool> setData(MediaQueryData mediaQuery) async {
    _globalStrings = GlobalStrings._();
    _apiStrings = ApiStrings._();
    _device = Device._(
      screenSize: mediaQuery.size,
      orientation: mediaQuery.orientation,
    );
    _dimen = Dimen._(
      device: _device,
      screenPadding: mediaQuery.padding,
      viewInsets: mediaQuery.viewInsets,
    );
    _space = Spaces._(_dimen);
    _assets = Assets._();
    _palette = Palette._();
    _theme = Themes._(palette: palette);
    return true;
  }

  static Device get device => _device;

  static Dimen get dimen => _dimen;

  static Spaces get space => _space;

  static Palette get palette => _palette;

  static Assets get assets => _assets;

  static StringRes get stringRes => _stringRes;

  static Themes get theme => _theme;

  static GlobalStrings get globals => _globalStrings;

  static ApiStrings get apiStrings => _apiStrings;
}
