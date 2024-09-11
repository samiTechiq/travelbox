import 'package:flutter/cupertino.dart';

class TicketViewClipper extends CustomClipper<Path> {
  final bool drawTriangle;
  final bool drawArc;

  final Axis triangleAxis;
  final Size triangleSize;
  final double trianglePos;

  final bool drawBorder;
  final double borderRadius;

  TicketViewClipper(
      this.drawTriangle,
      this.drawArc,
      this.triangleAxis,
      this.triangleSize,
      this.trianglePos,
      this.drawBorder,
      this.borderRadius,
      );

  @override
  Path getClip(Size size) {
    Path path = Path();

    Rect foregroundRect = Rect.fromLTRB(0, 0, size.width, size.height);

    path.moveTo(foregroundRect.left, foregroundRect.top);

    if (triangleAxis == Axis.horizontal) {
      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.left, foregroundRect.top),
          Offset(foregroundRect.right, foregroundRect.top),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);

      if (drawBorder) {
        _addArcPointToPath(
            foregroundRect,
            path,
            Offset(foregroundRect.right, foregroundRect.top),
            Offset(foregroundRect.right, foregroundRect.bottom),
            borderRadius);
      } else {
        path.lineTo(foregroundRect.right, foregroundRect.bottom);
      }

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.right, foregroundRect.bottom),
          Offset(foregroundRect.left, foregroundRect.bottom),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);

      if (drawBorder) {
        _addArcPointToPath(
            foregroundRect,
            path,
            Offset(foregroundRect.left, foregroundRect.bottom),
            Offset(foregroundRect.left, foregroundRect.top),
            borderRadius);
      } else {
        path.lineTo(foregroundRect.left, foregroundRect.top);
      }
    } else {
      if (drawBorder) {
        _addArcPointToPath(
            foregroundRect,
            path,
            Offset(foregroundRect.left, foregroundRect.top),
            Offset(foregroundRect.right, foregroundRect.top),
            borderRadius);
      } else {
        path.lineTo(foregroundRect.right, foregroundRect.bottom);
      }

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.right, foregroundRect.top),
          Offset(foregroundRect.right, foregroundRect.bottom),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);

      if (drawBorder) {
        _addArcPointToPath(
            foregroundRect,
            path,
            Offset(foregroundRect.right, foregroundRect.bottom),
            Offset(foregroundRect.left, foregroundRect.bottom),
            borderRadius);
      } else {
        path.lineTo(foregroundRect.left, foregroundRect.top);
      }

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.left, foregroundRect.bottom),
          Offset(foregroundRect.left, foregroundRect.top),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);
    }

    // canvas.drawShadow(path, Colors.grey, 2, true);

    // canvas.clipPath(path);

    return path;
  }

  void _addTrianglePointToPath(Rect size, Path path, Offset start, Offset end,
      double trianglePos, Size triangleSize,
      {bool isTriangle = false, bool isArc = false}) {
    if (start.dy == end.dy) {
      //Draw Horizontal Triangle

      if (end.dx > start.dx) {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(
              start.dx + (size.width * trianglePos) - triangleSize.width / 2,
              start.dy);
          path.arcToPoint(
              Offset(
                  start.dx +
                      (size.width * trianglePos) +
                      triangleSize.width / 2,
                  start.dy),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(
            start.dx + (size.width * trianglePos) - triangleSize.width / 2,
            start.dy);
        if (isTriangle) {
          path.lineTo(start.dx + (size.width * trianglePos),
              start.dy + triangleSize.height);
        }
        path.lineTo(
            start.dx + (size.width * trianglePos) + triangleSize.width / 2,
            start.dy);
        path.lineTo(end.dx, end.dy);
      } else {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(
              end.dx + (size.width * trianglePos) + triangleSize.width / 2,
              end.dy);
          path.arcToPoint(
              Offset(
                  end.dx + (size.width * trianglePos) - triangleSize.width / 2,
                  end.dy),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(
            end.dx + (size.width * trianglePos) + triangleSize.width / 2,
            end.dy);
        if (isTriangle) {
          path.lineTo(end.dx + (size.width * trianglePos),
              end.dy - triangleSize.height);
        }

        path.lineTo(
            end.dx + (size.width * trianglePos) - triangleSize.width / 2,
            end.dy);
        path.lineTo(end.dx, end.dy);
      }
    } else if (start.dx == end.dx) {
      //Draw Vertical Triangle
      if (end.dy > start.dy) {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(start.dx,
              start.dy + (size.height * trianglePos) - triangleSize.width / 2);
          path.arcToPoint(
              Offset(
                  start.dx,
                  start.dy +
                      (size.height * trianglePos) +
                      triangleSize.width / 2),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(start.dx,
            start.dy + (size.height * trianglePos) - (triangleSize.width / 2));
        if (isTriangle) {
          path.lineTo(start.dx - triangleSize.height,
              start.dy + (size.height * trianglePos));
        }
        path.lineTo(start.dx,
            start.dy + (size.height * trianglePos) + (triangleSize.width / 2));
        path.lineTo(end.dx, end.dy);
      } else {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(end.dx,
              end.dy + (size.height * trianglePos) + triangleSize.width / 2);
          path.arcToPoint(
              Offset(
                  end.dx,
                  end.dy +
                      (size.height * trianglePos) -
                      triangleSize.width / 2),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);

          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(end.dx,
            end.dy + (size.height * trianglePos) + triangleSize.width / 2);
        if (isTriangle) {
          path.lineTo(end.dx + triangleSize.height,
              end.dy + (size.height * trianglePos));
        }
        path.lineTo(end.dx,
            end.dy + (size.height * trianglePos) - triangleSize.width / 2);
        path.lineTo(end.dx, end.dy);
      }
    }
  }

  void _addArcPointToPath(
      Rect size, Path path, Offset start, Offset end, double radius) {
    if (start.dx == end.dx) {
      //Draw vertical lines

      double height = size.height.abs();
      double offsetBothSide = (height % (radius * 3)) / 2;
      int numOfArc = (height / (radius * 3)).truncate();

      if (end.dy > start.dy) {
        path.relativeLineTo(0, offsetBothSide);
        for (int i = 0; numOfArc > i; i++) {
          path.relativeLineTo(0, radius * .5);
          path.relativeArcToPoint(Offset(0, radius * 2),
              radius: Radius.circular(radius), clockwise: false);
          path.relativeLineTo(0, radius * .5);
        }
        path.relativeLineTo(0, offsetBothSide);
      } else {
        path.relativeLineTo(0, -offsetBothSide);
        for (int i = 0; numOfArc > i; i++) {
          path.relativeLineTo(0, -(radius * .5));
          path.relativeArcToPoint(Offset(0, -(radius * 2)),
              radius: Radius.circular(radius), clockwise: false);
          path.relativeLineTo(0, -(radius * .5));
        }
        path.relativeLineTo(0, -offsetBothSide);
      }
    } else if (start.dy == end.dy) {
      double width = size.width.abs();
      double offsetBothSide = (width % (radius * 3)) / 2;
      int numOfArc = (width / (radius * 3)).truncate();

      if (end.dx > start.dx) {
        path.relativeLineTo(offsetBothSide, 0);
        for (int i = 0; numOfArc > i; i++) {
          path.relativeLineTo(radius * .5, 0);
          path.relativeArcToPoint(Offset(radius * 2, 0),
              radius: Radius.circular(radius), clockwise: false);
          path.relativeLineTo(radius * .5, 0);
        }
        path.relativeLineTo(offsetBothSide, 0);
      } else {
        path.relativeLineTo(-offsetBothSide, 0);
        for (int i = 0; numOfArc > i; i++) {
          path.relativeLineTo(-(radius * .5), 0);
          path.relativeArcToPoint(Offset(-(radius * 2), 0),
              radius: Radius.circular(radius), clockwise: false);
          path.relativeLineTo(-(radius * .5), 0);
        }
        path.relativeLineTo(-offsetBothSide, 0);
      }
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}