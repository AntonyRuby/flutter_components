import 'package:flutter/material.dart';

class DottedIndicator extends StatefulWidget {
  const DottedIndicator({super.key});

  @override
  State<DottedIndicator> createState() => _DottedIndicatorState();
}

class _DottedIndicatorState extends State<DottedIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;
  // animation color
  late List<Animation<Color?>> color;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    // color tween
    color = [
      ColorTween(
              begin: Color(0xff222222), end: Color(0xff222222).withOpacity(0.3))
          .animate(controller),
      ColorTween(
              begin: Color(0xff222222).withOpacity(0.6), end: Color(0xff222222))
          .animate(controller),
      ColorTween(
              begin: Color(0xff222222).withOpacity(0.3),
              end: Color(0xff222222).withOpacity(1))
          .animate(controller)
    ];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: color[0],
                  builder: (BuildContext _, Widget? __) {
                    return Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: color[0].value,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 9,
              ),
              Container(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: color[1],
                  builder: (BuildContext _, Widget? __) {
                    return Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: color[1].value,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 9,
              ),
              Container(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: color[2],
                  builder: (BuildContext _, Widget? __) {
                    return Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: color[2].value,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
