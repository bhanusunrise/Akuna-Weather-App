import 'package:akuna/components.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final String cityName;
  final String time;
  final String temperature;
  final String status;

  const InfoScreen({
    Key? key,
    required this.cityName,
    required this.time,
    required this.temperature,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove the elevation

        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset('assets/logo/logo.png'),
        ),

        title: Center(
          child: Text(
            cityName,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
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
                  Text('Time: $time'),
                  Text('Temperature: $temperature'),
                  Text('Status: $status'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
