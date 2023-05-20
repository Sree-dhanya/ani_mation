import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _rotationAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 42, 42),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: _rotationAnimation.value + 0.2,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 96, 56, 166),
                    borderRadius:
                        BorderRadius.circular(_radiusAnimation.value)),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.4,
              child: Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 28, 1, 53),
                    borderRadius:
                        BorderRadius.circular(_radiusAnimation.value)),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.6,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 25, 2, 65),
                    borderRadius:
                        BorderRadius.circular(_radiusAnimation.value)),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.8,
              child: Container(
                width: 175,
                height: 175,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 5, 111, 7),
                    borderRadius:
                        BorderRadius.circular(_radiusAnimation.value)),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 1.0,
              child: Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 206, 232, 3),
                    borderRadius:
                        BorderRadius.circular(_radiusAnimation.value)),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 1.2,
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 88, 18),
                    borderRadius:
                        BorderRadius.circular(_radiusAnimation.value)),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 1.4,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 87, 12, 12),
                    borderRadius:
                        BorderRadius.circular(_radiusAnimation.value)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
