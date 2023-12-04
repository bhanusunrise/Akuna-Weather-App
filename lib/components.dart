import 'package:akuna/search.dart';
import 'package:akuna/services/weather_service.dart';
import 'package:flutter/material.dart';

import 'info.dart';
import 'model/weather.dart';

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

class NavBar extends StatelessWidget implements PreferredSizeWidget {
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
        child: Image.asset(
          'assets/logo/logo.png',
          height: 60,
          width: 60,
        ),
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
          child: IconButton(
            onPressed: () {
              // Navigate to the search window here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            icon: Image.asset(
              'assets/search/search.png',
              height: 40,
              width: 40,
            ),
          ),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0), // Set border radius to 20
        child: Container(
          color: Colors.black.withOpacity(0.5), // Set red color with transparency
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
      ),
    );
  }
}

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function(String) onSearch;

  const SearchAppBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textInputWidth = screenWidth * 0.75; // 75% of the screen width

    return AppBar(
      title: null, // Set the title to null for left alignment
      backgroundColor: Colors.transparent,
      elevation: 0, // Remove the elevation
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: textInputWidth,
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: 'Type Colombo, New York, Helsinki etc.',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white), // Set the text color
                onChanged: (value) {
                  // Handle text field changes
                },
              )

            ),
            IconButton(
              icon: Image.asset(
                'assets/search/search.png',
                height: 40,
                width: 40,),
              onPressed: () async {
                widget.onSearch(_textController.text);
                String cityName = _textController.text;
                WeatherService weatherService = WeatherService();
                Weather weather = await weatherService.getWeatherData(cityName);

                double temp = weather.currentTemp;
                String temperature = "$temp °C";
                String condition = weather.condition;
                String country = weather.country;
                String getIcon = weather.icon;
                String icon = "http:$getIcon";
                double getWindSpeed = weather.windSpeed;
                String windSpeed = "${getWindSpeed}km/h";
                int getWindDegree = weather.windDegree;
                String windDegree = "$getWindDegree°";
                double getPressure = weather.pressure;
                String pressure = "${getPressure}mbr";
                int getHumidity = weather.humidity;
                String humidity = getHumidity.toString();
                double getPrecipitation = weather.precipitation;
                String precipitation = "${getPrecipitation}mm";


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoScreen(cityName: cityName, temperature: temperature, status: condition, country:country, icon: icon, windSpeed: windSpeed, windDegree: windDegree, pressure: pressure, humidity: humidity, precipitation: precipitation)),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
