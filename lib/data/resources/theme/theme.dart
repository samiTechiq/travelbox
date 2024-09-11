part of '../r.dart';

class Themes {
  final Palette _palette;

  Themes._({required Palette palette}) : _palette = palette;

  static const String _coolwonderFontFamily = 'Coolwonder';
  static const String _larkenLightFontFamily = 'larken-light.ttf';
  static const String _interVariableFontFamily = 'Inter';
  static const String _larkenDEMOFontFamily = 'LarkenDEMO-Regular.otf';
  static const String _larken = 'larken';
  static const String _sfUI = 'sf-ui-display-ultralight.otf';
  static const String _neueMontrealRegular = 'NeueMontreal-Regular.otf';
  static const String _roboto = 'roboto';

  String get coolwonderFontFamily => _coolwonderFontFamily;

  String get larkenLightFontFamily => _larkenLightFontFamily;

  String get interRegular => _interVariableFontFamily;

  String get larkenDemoRegular => _larkenDEMOFontFamily;

  String get larken => _larken;

  String get sfUI => _sfUI;

  String get neueMontrealRegular => _neueMontrealRegular;

  String get roboto => _roboto;

  TextStyle get genericTextStyle => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      fontFamily: _interVariableFontFamily,
      color: R.palette.textFieldHintGreyColor);

  TextStyle get otpNumberTextStyle => TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        fontFamily: R.theme.interRegular,
        color: R.palette.mediumBlack,
      );

  TextStyle get robotoW600 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: _roboto,
        fontStyle: FontStyle.normal,
      );

  TextStyle get robotoTextStyle => const TextStyle(
        fontSize: 16,
        fontFamily: _roboto,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  BoxDecoration get genericCardDecoration => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: _palette.trailingPersonColor.withOpacity(0.6),
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: _palette.appWhiteColor,
      );

  BoxDecoration get clipperBoxDecoration => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: _palette.trailingPersonColor,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        color: _palette.appWhiteColor,
      );

  BoxDecoration get cardDecoration => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: _palette.trailingPersonColor.withOpacity(0.25),
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 0.3, //extend the shadow
            offset: const Offset(
              -1.0, // Move to right 5  horizontally
              -1.0, // Move to bottom 5 Vertically
            ),
          ),
          BoxShadow(
            color: _palette.trailingPersonColor,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 0.3, //extend the shadow
            offset: const Offset(
              1.0, // Move to right 5  horizontally
              1.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color: _palette.appWhiteColor,
      );
}
