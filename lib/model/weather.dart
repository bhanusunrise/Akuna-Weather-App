class Weather {
  final String condition;
  final double currentTemp;
  final String currentConditionIcon;
  final String country;
  final String icon;


  Weather({
    this.condition = "Sunny",
    this.currentTemp = 100,
    this.currentConditionIcon = "assets/images/cloudy.png",
    this.country = "2023-12-01 2:11",
    this.icon = "Hi"
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        condition: json['current']['condition']['text'],
        currentConditionIcon: json['current']['condition']['icon'],
        currentTemp: json['current']['temp_c'],
        country: json['location']['country'],
        icon: json['current']['condition']['icon']
    );
  }
}