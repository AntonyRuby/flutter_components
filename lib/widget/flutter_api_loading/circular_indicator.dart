import 'package:flutter/material.dart';

class CircularIndicator extends StatefulWidget {
  final Color? backgroundColor;
  final Color? circularIndicatorColor;
  final Color? valueColor;
  const CircularIndicator({
    super.key,
    this.backgroundColor,
    this.circularIndicatorColor,
    this.valueColor,
  });

  @override
  State<CircularIndicator> createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator>
    with TickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: widget.backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: widget.circularIndicatorColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
