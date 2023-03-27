part of rotating_shape;

/// Base widget for rotating shape.
class RotatingShape extends StatefulWidget {
  /// Constructor for rotating shape widget.
  const RotatingShape({
    Key? key,
    required this.child,
    required this.shape,
    this.color = Colors.green,
    this.size = 200,
    this.strokeWidth = 1,
    this.itemsDistance,
    this.animationDuration = const Duration(seconds: 30),
    this.polygonChangerDuration = const Duration(seconds: 1),
    this.reverse = true,
    this.autoPolygon = false,
    this.polygonSides = 3,
    this.itemCount = 3,
    this.childMargin,
    this.paintingStyle = PaintingStyle.stroke,
    this.strokeCap = StrokeCap.round,
    this.animation = Curves.linear,
  }) : super(key: key);

  /// Center widget for rotating shape.
  final Widget child;

  /// Choose shape for rotating.
  final Shape shape;

  /// The color to use when stroking or filling a shape.
  final Color color;

  /// Size for the shape.
  final double size;

  /// How wide to make edges drawn.
  final double strokeWidth;

  /// Distance between each rotating shape.
  final double? itemsDistance;

  /// Animation Duration for rotating shape.
  final Duration animationDuration;

  /// Duration for changing from one polygon to another.
  final Duration polygonChangerDuration;

  /// Reverse rotating.
  final bool reverse;

  /// Changingin polygon sides automatically.
  final bool autoPolygon;

  /// Number of Polygon sides.
  final int polygonSides;

  /// Number of rotating items around child widget.
  final int itemCount;

  /// Child widget margin.
  final EdgeInsetsGeometry? childMargin;

  /// Whether to paint inside shapes, the edges of shapes, or both.
  final PaintingStyle paintingStyle;

  /// The kind of finish to place on the end of lines drawn.
  final StrokeCap strokeCap;

  /// The curve to apply between [begin] and [end].
  final Curve animation;

  @override
  State<RotatingShape> createState() => _RotatingShapeState();
}

class _RotatingShapeState extends State<RotatingShape>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late Timer _timer;

  int _polygonSidesCount = 3;

  @override
  void initState() {
    super.initState();
    initAnimations();
    if (widget.autoPolygon) polygonChanger();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        ...List<Widget>.generate(
            widget.itemCount, (i) => _rotationItem(i, widget.itemCount)),
        _child(),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  Center _child() {
    return Center(
      child: SizedBox(
        width: widget.size * 0.7,
        height: widget.size * 0.7,
        child: widget.child,
      ),
    );
  }

  void initAnimations() {
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: widget.animation,
        ),
      ),
    );

    // reverse or same direction animation
    if (widget.reverse) _animation = ReverseAnimation(_animation);

    _controller.repeat();
  }

  void polygonChanger() {
    _timer = Timer.periodic(widget.polygonChangerDuration, (timer) {
      setState(() {
        _polygonSidesCount++;
      });
      if (_polygonSidesCount == 10) {
        setState(() {
          _polygonSidesCount = 3;
        });
      }
    });
  }

  Center _rotationItem(int index, int total) {
    return Center(
      child: RotationTransition(
        turns: _animation,
        child: CustomPaint(
          painter: _customPainter(
            painterShape: widget.shape,
            index: index,
            total: total,
          ),
          child: Container(
            margin: widget.childMargin,
            width: widget.size +
                (widget.itemsDistance != null
                    ? (widget.itemsDistance! * index)
                    : (index / 5) * widget.size),
            height: widget.size +
                (widget.itemsDistance != null
                    ? (widget.itemsDistance! * index)
                    : (index / 5) * widget.size),
          ),
        ),
      ),
    );
  }

  CustomPainter _customPainter({
    required Shape painterShape,
    required int index,
    required int total,
  }) {
    switch (painterShape) {
      case Shape.polygon:
        return PolygonPainter(
          color: widget.color.withOpacity(1 - (index / (total))),
          sides: widget.autoPolygon ? _polygonSidesCount : widget.polygonSides,
          paintingStyle: widget.paintingStyle,
          strokeCap: widget.strokeCap,
          strokeWidth: widget.strokeWidth,
        );

      case Shape.custom:
        return CustomShapePainter(
          color: widget.color.withOpacity(1 - (index / (total))),
          paintingStyle: widget.paintingStyle,
          strokeCap: widget.strokeCap,
          strokeWidth: widget.strokeWidth,
        );
      case Shape.rectangle:
        return RectanglePainter(
          color: widget.color.withOpacity(1 - (index / (total))),
          paintingStyle: widget.paintingStyle,
          strokeCap: widget.strokeCap,
          strokeWidth: widget.strokeWidth,
        );

      default:
        return PolygonPainter(
          color: widget.color.withOpacity(1 - (index / (total))),
          sides: widget.polygonSides,
          paintingStyle: widget.paintingStyle,
          strokeCap: widget.strokeCap,
          strokeWidth: widget.strokeWidth,
        );
    }
  }
}
