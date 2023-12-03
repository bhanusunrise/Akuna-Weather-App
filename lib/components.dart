import 'package:flutter/material.dart';

class GradiantFiller extends StatelessWidget {
  final List<Color> gradientColors;
  final Widget child;

  // Default gradient colors
  static const List<Color> defaultGradientColors = [Colors.black45, Colors.lightBlue];

  // Default child (an empty Container)
  static const Widget defaultChild = Center();

  // Constructor with default values
  const GradiantFiller({
    Key? key,
    this.gradientColors = defaultGradientColors,
    this.child = defaultChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      child: child,
    );
  }
}

class SplashLogo extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const SplashLogo({
    Key? key,
  })   : imagePath = 'assets/logo/logo.png',
        width = 120.0,
        height = 120.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
    );
  }
}