/*
"hourly_units": {
    "time": "iso8601",
    "temperature_2m": "°C",
    "relative_humidity_2m": "%",
    "precipitation": "mm",
    "weather_code": "wmo code",
    "wind_speed_10m": "km/h",
    "is_day": ""
  },

*/
class HourlyModel {
  final List<dynamic> time;
  final List<dynamic> temperature_2m;
  final List<dynamic> relativeHumidity_2m;
  final List<dynamic> weatherCode;
  final List<dynamic> windSpeed_10m;
  final List<dynamic> isDay;

  HourlyModel({required this.time, required this.temperature_2m, required this.relativeHumidity_2m, required this.weatherCode, required this.windSpeed_10m, required this.isDay});

  factory HourlyModel.fromJson (Map<String,dynamic> json){
    return HourlyModel(time: json["time"], temperature_2m: json["temperature_2m"]  , relativeHumidity_2m: json["relative_humidity_2m"], weatherCode: json["weather_code"], windSpeed_10m: json["wind_speed_10m"], isDay: json["is_day"]);
  }

}