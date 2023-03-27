part of rotating_shape;

/// Painter class for rectangle.

class RectanglePainter extends CustomPainter {
  /// Constructor for rectangle painter.
  RectanglePainter({
    required this.color,
    required this.strokeCap,
    required this.paintingStyle,
    required this.strokeWidth,
  });

  /// The color to use when stroking or filling a shape.
  final Color color;

  /// Whether to paint inside shapes, the edges of shapes, or both.
  final PaintingStyle paintingStyle;

  /// The kind of finish to place on the end of lines drawn.
  final StrokeCap strokeCap;

  /// How wide to make edges drawn.
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..style = paintingStyle;

    /// Draw rectangle.
    final Rect rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height * 1.8,
    );

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// Painter class for custom shape.
class CustomShapePainter extends CustomPainter {
  /// Constructor for custom shape painter.
  CustomShapePainter({
    required this.color,
    required this.strokeCap,
    required this.paintingStyle,
    required this.strokeWidth,
  });

  /// The color to use when stroking or filling a shape.
  final Color color;

  /// Whether to paint inside shapes, the edges of shapes, or both.
  final PaintingStyle paintingStyle;

  /// The kind of finish to place on the end of lines drawn.
  final StrokeCap strokeCap;

  /// How wide to make edges drawn.
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..style = paintingStyle;

    canvas.drawPath(getPath(size.width, size.height), paint);
  }

  /// Draw custom shape.
  Path getPath(double x, double y) {
    return Path()
      ..moveTo(x - 10, 0)
      ..lineTo(0, 0)
      ..lineTo(0, y - 10)
      ..moveTo(10, y)
      ..lineTo(x, y)
      ..lineTo(x, 10);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// Painter class for polygon.
class PolygonPainter extends CustomPainter {
  /// Constructor for polygon painter.
  PolygonPainter({
    required this.color,
    required this.sides,
    required this.strokeCap,
    required this.paintingStyle,
    required this.strokeWidth,
  });

  /// The color to use when stroking or filling a shape.
  final Color color;

  /// Whether to paint inside shapes, the edges of shapes, or both.
  final PaintingStyle paintingStyle;

  /// The kind of finish to place on the end of lines drawn.
  final StrokeCap strokeCap;

  /// How wide to make edges drawn.
  final double strokeWidth;

  /// Number of polygon edges.
  final int sides;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..style = paintingStyle;

    canvas.drawPath(getPath(size.width, size.height), paint);
  }

  /// Draw polygon.
  Path getPath(double x, double y) {
    final center = Offset(x / 2, y / 2);
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);
    final radius = x / 2;

    Path path = Path();

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );
    for (final angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
