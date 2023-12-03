class Weather {
  final String condition;
  final double currentTemp;
  final String currentConditionIcon;
  final String currentDateAndTime;

  Weather({
    this.condition = "Sunny",
    this.currentTemp = 100,
    this.currentConditionIcon = "assets/images/cloudy.png",
    this.currentDateAndTime = "2023-12-01 2:11"
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        condition: json['current']['condition']['text'],
        currentConditionIcon: json['current']['condition']['icon'],
        currentTemp: json['current']['temp_c'],
        currentDateAndTime: json['location']['localtime']
    );
  }
}