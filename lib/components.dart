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

class NavBar extends StatelessWidget implements PreferredSizeWidget{
  final String cityName;
  final String time;

  const NavBar({
    Key? key,
    required this.cityName,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0, // Remove the elevation

      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Image.asset('assets/logo/logo.png', height: 60, width: 60,),
      ),

      title: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              time,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Image.asset('assets/search/search.png', height: 50, width: 50,),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class WeatherImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double paddingTop; // Add padding top

  const WeatherImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.paddingTop = 0, // Default padding top
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop), // Add top padding
      child: SizedBox(
        width: width,
        height: height,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class WeatherText extends StatelessWidget {
  final String text;

  const WeatherText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class ExtraLeftIcon extends StatelessWidget {
  final String fieldOneName;
  final String fieldOneValue;
  final String iconPath;
  final double iconWidth;
  final double iconHeight;

  const ExtraLeftIcon({
    Key? key,
    required this.fieldOneValue,
    required this.iconPath,
    required this.fieldOneName,
    required this.iconHeight,
    required this.iconWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding here
      child: Container(
        color: Colors.red.withOpacity(0.1), // Set blue color with transparency
        child: Row(
          children: [
            // First Column
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  iconPath,
                  width: iconWidth,
                  height: iconHeight,
                  color: Colors.white,

                ),
                // Add more widgets as needed
              ],
            ),
            const SizedBox(width: 20.0), // Add spacing between columns
            // Second Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the right
              children: [
                Text('$fieldOneName: $fieldOneValue', style: const TextStyle(fontSize: 20, color: Colors.white)),
                // Add more widgets as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
