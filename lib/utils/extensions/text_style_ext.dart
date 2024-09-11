import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {

  TextStyle size(double fontSize) => copyWith(fontSize: fontSize);

  TextStyle lineHeight(double lineHeight) => copyWith(height: lineHeight);

  TextStyle fontWeight(FontWeight fontWeight) => copyWith(fontWeight: fontWeight);

  TextStyle fontFamily(String fontFamily) => copyWith(fontFamily: fontFamily);

  double get widthByStyle {
    final textSpan = TextSpan(
      text: 'abc',
      style: this,
    );
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();

    return tp.width;
  }

  double get heightByStyle {
    final textSpan = TextSpan(
      text: 'abc',
      style: this,
    );
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();

    return tp.width;
  }
}