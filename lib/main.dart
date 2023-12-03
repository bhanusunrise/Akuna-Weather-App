import 'package:akuna/info.dart';
import 'package:akuna/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'components.dart';
import 'model/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the fade-in animation when the widget is first created
    Future.delayed(Duration.zero, () {
      setState(() {
        opacity = 1.0;
      });
    });

    // Schedule the fade-out and navigation animation after some delay
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        opacity = 0.0;
      });
      // Navigate to the info screen after fade-out
      Future.delayed(const Duration(seconds: 1), () async {
        WeatherService weatherService = WeatherService();
        Weather weather = await weatherService.getWeatherData("Colombo");
        const String cityName = "Colombo";
        double temp = weather.currentTemp;
        String temperature = "$temp°C";
        String condition = weather.condition;
        String country = weather.country;
        String geticon = weather.icon;
        String icon = "http:$geticon";
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoScreen(cityName: cityName, temperature: temperature, status: condition, country:country, icon: icon)),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedOpacity(
          duration: const Duration(milliseconds: 750),
          opacity: opacity,
          child: const GradiantFiller(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SplashLogo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
