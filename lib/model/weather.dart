class Weather {
  final String condition;
  final double currentTemp;
  final String currentConditionIcon;
  final String country;
  final String icon;
  final double windSpeed;
  final int windDegree;
  final double pressure;
  final int humidity;
  final double precipitation;


  Weather({
    this.condition = "Sunny",
    this.currentTemp = 100,
    this.currentConditionIcon = "assets/images/cloudy.png",
    this.country = "2023-12-01 2:11",
    this.icon = "Hi",
    this.windSpeed = 1000,
    this.windDegree = 2000,
    this.humidity = 500,
    this.pressure = 200.0,
    this.precipitation = 20000.0
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        condition: json['current']['condition']['text'],
        currentConditionIcon: json['current']['condition']['icon'],
        currentTemp: json['current']['temp_c'],
        country: json['location']['country'],
        icon: json['current']['condition']['icon'],
        windSpeed: json['current']['wind_kph'],
        windDegree: json['current']['wind_degree'],
        pressure: json['current']['pressure_mb'],
        humidity: json['current']['humidity'],
        precipitation: json['current']['precip_mm']
    );
  }
}