part of 'wheel.dart';

/// Draws a slice of a circle. The slice's arc starts at the right (3 o'clock)
/// and moves clockwise as far as specified by angle.

// class _CircleSlicePainter extends CustomPainter {
//   final Color fillColor;
//   final Color? strokeColor;
//   final double strokeWidth;
//   final double angle;

//   const _CircleSlicePainter({
//     required this.fillColor,
//     this.strokeColor,
//     this.strokeWidth = 1,
//     this.angle = _math.pi / 2,
//   }) : assert(angle > 0 && angle < 2 * _math.pi);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final radius = _math.min(size.width, size.height);
//     final path = _CircleSlice.buildSlicePath(radius, angle);

//     // Draw the central circle in the center of the slice
//     final centralCircleRadius = 60.0;

//     // Fill slice area
//     final sliceFillPaint = Paint()
//       ..color = fillColor
//       ..style = PaintingStyle.fill;
//     canvas.drawPath(path, sliceFillPaint);

//     // Draw slice border
//     if (strokeWidth > 0) {
//       final sliceBorderPaint = Paint()
//         ..color = strokeColor!
//         ..strokeWidth = strokeWidth
//         ..style = PaintingStyle.stroke;
//       canvas.drawPath(path, sliceBorderPaint);
//     }

//      final centralCirclePaint = Paint()
//       ..color = VGAppTheme.defaultThemeData.colorScheme.background // Customize the central circle color
//       ..style = PaintingStyle.fill;
//     canvas.drawCircle(
//     Offset(0, 0),
//     centralCircleRadius,
//     centralCirclePaint,
//   );

//   // Draw a border around the central circle
//   final centralCircleBorderPaint = Paint()
//     ..color = VGApplicationTheme.colors.base200 // Color of the border
//     ..strokeWidth = 8.0 // Width of the border
//     ..style = PaintingStyle.stroke;
//   canvas.drawCircle(
//     Offset(0, 0),
//     centralCircleRadius,
//     centralCircleBorderPaint,
//   );
//   }

//   @override
//   bool shouldRepaint(_CircleSlicePainter oldDelegate) {
//     return angle != oldDelegate.angle ||
//         fillColor != oldDelegate.fillColor ||
//         strokeColor != oldDelegate.strokeColor ||
//         strokeWidth != oldDelegate.strokeWidth;
//   }
// }

class _CircleSlicePainter extends CustomPainter {
  final Color fillColor;
  final Color? strokeColor;
  final double strokeWidth;
  final double angle;

  const _CircleSlicePainter({
    required this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1,
    this.angle = _math.pi / 2,
  }) : assert(angle > 0 && angle < 2 * _math.pi);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = _math.min(size.width, size.height);
    final path = _CircleSlice.buildSlicePath(radius, angle);
    const centralCircleRadius = 55.8;
    // fill slice area
    canvas.drawPath(
      path,
      Paint()
        ..color = fillColor
        ..style = PaintingStyle.fill,
    );

    // draw slice border
    if (strokeWidth > 0) {
      canvas.drawPath(
        path,
        Paint()
          ..color = strokeColor!
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke,
      );

      canvas.drawPath(
        Path()
          ..arcTo(
              Rect.fromCircle(
                center: Offset(0, 0),
                radius: radius,
              ),
              0,
              angle,
              false),
        Paint()
          ..color = strokeColor!
          ..strokeWidth = strokeWidth * 2
          ..style = PaintingStyle.stroke,
      );
    }

    final centralCirclePaint = Paint()
      ..color = VGAppTheme.defaultThemeData.colorScheme
          .background // Customize the central circle color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(0, 0),
      centralCircleRadius,
      centralCirclePaint,
    );

    // Draw a border around the central circle
    final centralCircleBorderPaint = Paint()
      ..color = VGApplicationTheme.colors.base200 // Color of the border
      ..strokeWidth = 8.0 // Width of the border
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
      Offset(0, 0),
      centralCircleRadius,
      centralCircleBorderPaint,
    );
  }

  @override
  bool shouldRepaint(_CircleSlicePainter oldDelegate) {
    return angle != oldDelegate.angle ||
        fillColor != oldDelegate.fillColor ||
        strokeColor != oldDelegate.strokeColor ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}
