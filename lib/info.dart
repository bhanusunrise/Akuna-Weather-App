import 'package:akuna/components.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final String cityName;
  final String country;
  final String temperature;
  final String status;
  final String icon;
  final String windSpeed;
  final String windDegree;
  final String pressure;
  final String humidity;
  final String precipitation;

  const InfoScreen({
    Key? key,
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.status,
    required this.icon,
    required this.windSpeed,
    required this.windDegree,
    required this.pressure,
    required this.humidity,
    required this.precipitation,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NavBar(cityName: cityName, time: country),
      body: Stack(
        children: [
          // Background gradient for the entire screen
          const GradiantFiller(),
          Container(
            padding: const EdgeInsets.all(16.0), // Adjust padding as needed
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherImage(imageUrl: icon, width: 200.0, height: 200.0, paddingTop: 60,),
                  WeatherText(text: "$status | $temperature"),
                  const SizedBox(height: 20.0), // Add some spacing
                  ExtraLeftIcon(fieldOneName: "Wind Speed ",fieldOneValue: windSpeed, iconPath: 'assets/ui/speed.png', iconHeight: 50, iconWidth: 50,),
                  ExtraLeftIcon(fieldOneName: "Wind Degree ",fieldOneValue: windDegree, iconPath: 'assets/ui/angle.png', iconHeight: 50, iconWidth: 50,),
                  ExtraLeftIcon(fieldOneName: "Air Pressure ",fieldOneValue: pressure, iconPath: 'assets/ui/preasure.png', iconHeight: 50, iconWidth: 50,),
                  ExtraLeftIcon(fieldOneName: "Humidity ",fieldOneValue: humidity, iconPath: 'assets/ui/humidity.png', iconHeight: 50, iconWidth: 50,),
                  ExtraLeftIcon(fieldOneName: "precipitation ",fieldOneValue: windSpeed, iconPath: 'assets/ui/rain.png', iconHeight: 50, iconWidth: 50,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

