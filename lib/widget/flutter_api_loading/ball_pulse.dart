import 'package:flutter/material.dart';
import 'package:flutter_components/widget/flutter_api_loading/indicator_controller.dart';
import 'package:flutter_components/widget/flutter_api_loading/indicator_painter.dart';

/// BallPulse.
class BallPulse extends StatefulWidget {
  const BallPulse({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BallPulseState();
  }
}

class _BallPulseState extends State<BallPulse>
    with TickerProviderStateMixin, IndicatorController {
  static const _durationInMills = 750;

  static const _delayInMills = [500, 440, 380, 360, 240, 120];

  final List<AnimationController> _animationControllers = [];
  final List<Animation<double>> _scaleAnimations = [];
  final List<Animation<double>> _opacityAnimations = [];

  @override
  List<AnimationController> get animationControllers => _animationControllers;

  @override
  void initState() {
    super.initState();
    const cubic = Cubic(0.2, 0.68, 0.18, 0.08);
    for (int i = 0; i < 5; i++) {
      _animationControllers.add(AnimationController(
        value: _delayInMills[i] / _durationInMills,
        vsync: this,
        duration: const Duration(milliseconds: _durationInMills),
      ));
      _scaleAnimations.add(TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.1), weight: 45),
        TweenSequenceItem(tween: Tween(begin: 0.1, end: 1.0), weight: 35),
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 20),
      ]).animate(
          CurvedAnimation(parent: _animationControllers[i], curve: cubic)));
      _opacityAnimations.add(TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.7), weight: 45),
        TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 35),
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 20),
      ]).animate(
          CurvedAnimation(parent: _animationControllers[i], curve: cubic)));

      _animationControllers[i].repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widgets = List<Widget>.filled(14, Container());
    for (int i = 0; i < 5; i++) {
      widgets[i] = FadeTransition(
        opacity: _opacityAnimations[i],
        child: ScaleTransition(
          scale: _scaleAnimations[i],
          child: IndicatorShapeWidget(
            shape: Shape.circle,
            index: i,
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 10,
          child: widgets[0],
        ),
        SizedBox(width: 15, child: widgets[1]),
        SizedBox(width: 15, child: widgets[2]),
        SizedBox(width: 15, child: widgets[3]),
        SizedBox(width: 15, child: widgets[4]),
        SizedBox(width: 15, child: widgets[5]),
      ],
    );
  }
}
