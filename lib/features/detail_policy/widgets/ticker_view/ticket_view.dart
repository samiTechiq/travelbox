import 'package:flutter/material.dart';
import 'package:travelbox/features/detail_policy/widgets/ticker_view/ticker_view_clipper.dart';
import 'package:travelbox/features/detail_policy/widgets/ticker_view/ticker_view_painter.dart';

class TicketView extends StatelessWidget {
  final bool drawTriangle;
  final bool drawArc;

  final Axis triangleAxis;
  final Size triangleSize;
  final double trianglePos;

  final Color contentBackgroundColor;
  final Color backgroundColor;

  final EdgeInsets contentPadding;
  final EdgeInsets backgroundPadding;

  final double corderRadius;

  final bool drawDivider;
  final Color dividerColor;
  final double dividerStrokeWidth;

  final bool drawBorder;
  final double borderRadius;

  final bool drawShadow;

  final Widget? child;

  const TicketView({
    Key? key,
    this.corderRadius = 3,
    this.drawTriangle = true,
    this.drawArc = false,
    this.triangleAxis = Axis.horizontal,
    this.triangleSize = const Size(20, 10),
    this.trianglePos = .7,
    this.contentBackgroundColor = Colors.white,
    this.backgroundColor = Colors.red,
    this.contentPadding = const EdgeInsets.all(25),
    this.backgroundPadding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
    this.drawDivider = true,
    this.dividerColor = Colors.grey,
    this.dividerStrokeWidth = 2,
    this.drawBorder = true,
    this.borderRadius = 4,
    this.drawShadow = true,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TicketViewPainter(
          corderRadius,
          drawTriangle,
          drawArc,
          triangleAxis,
          triangleSize,
          trianglePos,
          contentBackgroundColor,
          backgroundColor,
          contentPadding,
          backgroundPadding,
          drawDivider,
          dividerColor,
          dividerStrokeWidth,
          drawBorder,
          borderRadius,
          drawShadow),
      child: Container(
        padding: contentPadding,
        child: ClipPath(
          clipper: TicketViewClipper(drawTriangle, drawArc, triangleAxis,
              triangleSize, trianglePos, drawDivider, borderRadius),
          child: child,
        ),
      ),
    );
  }
}
