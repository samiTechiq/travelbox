import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class SquareBox extends StatelessWidget {
  final Color? unFillBackColor;
  final Color? innerBoxColor;
  final bool checkValue;
  final BoxBorder? border;
  final BorderRadius borderRadius;
  final Color? iconColor;
  final double squareBoxSize;
  final double iconSize;

  const SquareBox(
      {super.key,
      this.unFillBackColor,
      this.innerBoxColor,
      this.border,
      this.squareBoxSize = 20,
      this.iconSize = 14,
      this.iconColor,
      this.borderRadius = const BorderRadius.all(Radius.circular(5)),
      this.checkValue = false});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: SquareBoxMobile(
        unFillBackColor: unFillBackColor,
        innerBoxColor: innerBoxColor,
        border: border,
        borderRadius: borderRadius,
        squareBoxSize: squareBoxSize,
        iconColor: iconColor,
        checkValue: checkValue,
        iconSize: iconSize,
      ),
      desktopLayout: SquareBoxDesktop(
        unFillBackColor: unFillBackColor,
        innerBoxColor: innerBoxColor,
        border: border,
        borderRadius: borderRadius,
        squareBoxSize: squareBoxSize,
        iconColor: iconColor,
        checkValue: checkValue,
        iconSize: iconSize,
      ),
    );
  }
}

class SquareBoxMobile extends StatelessWidget {
  final Color? unFillBackColor;
  final Color? innerBoxColor;
  final bool checkValue;
  final BoxBorder? border;
  final BorderRadius borderRadius;
  final Color? iconColor;
  final double squareBoxSize;
  final double iconSize;

  const SquareBoxMobile(
      {Key? key,
      this.unFillBackColor,
      this.innerBoxColor,
      this.border,
      this.squareBoxSize = 20,
      this.iconColor,
      this.iconSize = 14,
      this.borderRadius = const BorderRadius.all(Radius.circular(5)),
      this.checkValue = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: squareBoxSize,
        width: squareBoxSize,
        decoration: BoxDecoration(
            color: unFillBackColor ?? R.palette.appWhiteColor,
            borderRadius: borderRadius,
            border: border ??
                Border.all(
                    color: checkValue
                        ? R.palette.appPrimaryBlue
                        : R.palette.checkBoxGreyColor,
                    width: 1)),
        child: checkValue
            ? Container(
                decoration: BoxDecoration(
                  color: innerBoxColor ?? R.palette.appPrimaryBlue,
                ),
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: iconColor ?? R.palette.white,
                  size: iconSize,
                )),
              )
            : const SizedBox());
  }
}

class SquareBoxDesktop extends StatelessWidget {
  final Color? unFillBackColor;
  final Color? innerBoxColor;
  final bool checkValue;
  final BoxBorder? border;
  final BorderRadius borderRadius;
  final Color? iconColor;
  final double squareBoxSize;
  final double iconSize;

  const SquareBoxDesktop(
      {Key? key,
      this.unFillBackColor,
      this.innerBoxColor,
      this.border,
      this.squareBoxSize = 20,
      this.iconSize = 7,
      this.iconColor,
      this.borderRadius = const BorderRadius.all(Radius.circular(5)),
      this.checkValue = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: squareBoxSize,
        width: squareBoxSize,
        decoration: BoxDecoration(
            color: unFillBackColor ?? R.palette.appWhiteColor,
            borderRadius: borderRadius,
            border: border ??
                Border.all(
                    color: checkValue
                        ? R.palette.appPrimaryBlue
                        : R.palette.checkBoxGreyColor,
                    width: 2)),
        child: checkValue
            ? Container(
                decoration: BoxDecoration(
                  color: innerBoxColor ?? R.palette.appPrimaryBlue,
                ),
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: iconColor ?? R.palette.white,
                  size: iconSize,
                )),
              )
            : const SizedBox());
  }
}
