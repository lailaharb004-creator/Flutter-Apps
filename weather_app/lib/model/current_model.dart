/*
"current": {
    "time": "2026-11-12T16:00",
    "interval": 900,
    "is_day": 1,
    "temperature_2m": 19.6,
    "relative_humidity_2m": 26,
    "precipitation": 0,
    "weather_code": 0,
    "wind_speed_10m": 2.8
  },

*/

class CurrentModel {
  final String time;
  final int isDay;
  final double temperature_2m;
  final double apparentTemperature;
  final double relativeHumidity_2m;
  final int weatherCode;
  final double windSpeed_10m;


  CurrentModel({required this.time, required this.isDay, required this.temperature_2m, required this.relativeHumidity_2m, required this.weatherCode, required this.windSpeed_10m, required this.apparentTemperature});

  factory CurrentModel.fromJson(Map<String,dynamic> json){
    return CurrentModel(time: json["time"], isDay: json["is_day"], temperature_2m: (json["temperature_2m"] as num).toDouble(), relativeHumidity_2m: (json["relative_humidity_2m"]as num).toDouble(), weatherCode: json["weather_code"], windSpeed_10m: (json["wind_speed_10m"]as num).toDouble(), apparentTemperature: (json["apparent_temperature"]as num ).toDouble());
  }
  
}