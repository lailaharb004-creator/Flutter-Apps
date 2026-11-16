/*
"daily_units": {
    "time": "iso8601",
    "weather_code": "wmo code",
    "temperature_2m_max": "°C",
    "temperature_2m_min": "°C"
  },
*/
class DailyModel {
  final List<dynamic> time;
  final List<dynamic>weatherCode;
  final List<dynamic> maxTemprature;
  final List<dynamic> minTempreature;

  DailyModel({required this.time, required this.weatherCode, required this.maxTemprature, required this.minTempreature});

  factory DailyModel.fromJson (Map<String,dynamic>json){
    return DailyModel(time: json["time"], weatherCode: json["weather_code"], maxTemprature: json["temperature_2m_max"] ,minTempreature: json["temperature_2m_min"]);
  }
  
}
