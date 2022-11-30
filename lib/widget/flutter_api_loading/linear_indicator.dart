import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LinearIndicator extends StatefulWidget {
  final Color? backgroundColor;
  final Color? valueColor;
  double? progressValue = 0.0;
  LinearIndicator(
      {super.key, this.backgroundColor, this.valueColor, this.progressValue});

  @override
  State<LinearIndicator> createState() => _LinearIndicatorState();
}

class _LinearIndicatorState extends State<LinearIndicator>
    with TickerProviderStateMixin {
  // double progressValue = 0.0;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();

    // updateProgress();
  }

  // void updateProgress() {
  //   const oneSec = const Duration(seconds: 1);
  //   Timer.periodic(oneSec, (Timer timer) {
  //     setState(() {
  //       widget.progressValue = widget.progressValue! + 0.1;
  //       if (widget.progressValue!.toStringAsFixed(1) == '1.0') {
  //         timer.cancel();
  //         return;
  //       }
  //     });
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: widget.progressValue),
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                backgroundColor: widget.backgroundColor ?? Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.valueColor ?? Colors.black,
                ),
                minHeight: 10,
              );
            },
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Processing"),
            Text('${(widget.progressValue! * 100).round()}%'),
          ],
        )
      ],
    );
  }
}
