import 'package:akuna/components.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final String cityName;
  final String country;
  final String temperature;
  final String status;
  final String icon;

  const InfoScreen({
    Key? key,
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.status,
    required this.icon,
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
                  WeatherImage(imageUrl: icon, width: 150.0, height: 150.0),
                  WeatherText(text: "$status | $temperature"),
                  SizedBox(height: 20.0), // Add some spacing

                  // Two columns next to each other
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First Column
                      Column(
                        children: [
                          Text('Left Column Content'),
                          // Add more widgets as needed
                        ],
                      ),
                      SizedBox(width: 20.0), // Add spacing between columns
                      // Second Column
                      Column(
                        children: [
                          Text('Right Column Content'),
                          // Add more widgets as needed
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

