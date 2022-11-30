import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlutterLoading extends StatefulWidget {
  FlutterLoading(
      {Key? key,
      this.radius = 20,
      this.gradientColors = const <Color>[
        Colors.redAccent,
        Colors.orange,
        Colors.green
      ],
      this.strokeWidth = 5.0,
      this.backgroundColor = Colors.transparent})
      : super(key: key);
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;
  Color backgroundColor;

  @override
  State<FlutterLoading> createState() => FlutterLoadingState();
}

class FlutterLoadingState extends State<FlutterLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: widget.backgroundColor,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: CupertinoActivityIndicator(
                    radius: 15,
                    color: Colors.white,
                  ),
                ),
              ),

              // // Image.asset('assets/png/app_logo.png', width: 30, height: 30),
              // RotationTransition(
              //   turns: Tween<double>(begin: 0.0, end: 1.0)
              //       .animate(_animationController),
              //   child: CustomPaint(
              //     // size: Size.fromRadius(widget.radius),
              //     size: Size.fromRadius(30),
              //     painter: GradientCircularProgressPainter(
              //       // radius: widget.radius,
              //       radius: 30,
              //       gradientColors: widget.gradientColors,
              //       strokeWidth: widget.strokeWidth,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });

  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    final double offset = strokeWidth / 2;
    final Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(colors: gradientColors).createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
