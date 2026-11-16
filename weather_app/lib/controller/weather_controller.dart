import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/current_model.dart';
import 'package:weather_app/model/daily_model.dart';
import 'package:weather_app/model/hourly_model.dart';
import 'package:http/http.dart'as http;

class WeatherController extends ChangeNotifier{
  CurrentModel ?currentModel ;
  HourlyModel  ? hourlyModel  ;
  DailyModel   ? dailyModel   ;
  bool currentIsLoading=false;
  String ? currentErrorMessage;
  double longitude=35.9304;
  double latitude=31.9632;
  
  Future<void> getCurrentWeather ()async{


    currentIsLoading=true;
    currentErrorMessage=null;
    String url="https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=wind_speed_10m,temperature_2m,relative_humidity_2m,is_day,weather_code,apparent_temperature&timezone=auto";
    try{
      var response=await http.get(Uri.parse(url));
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        currentModel=CurrentModel.fromJson(data["current"]);
      }
      else{
        currentErrorMessage="ERROR :  ${response.statusCode}";
      }

    }
    catch(e){
      currentErrorMessage=e.toString();
    }
    currentIsLoading=false;
    notifyListeners();
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  bool hourlyIsLoading=false;
  String ? hourlyErrorMessage;


  Future<void> getHourlyWeather()async{
    hourlyIsLoading=true;
    hourlyErrorMessage=null;
    String url="https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m,relative_humidity_2m,precipitation,weather_code,wind_speed_10m,is_day&current=wind_speed_10m&timezone=auto";
    try{
      var response=await http.get(Uri.parse(url));
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        hourlyModel=HourlyModel.fromJson(data["hourly"]);
      }
      else{
        hourlyErrorMessage="ERROR : ${response.statusCode}";
      }
    }
    catch(e){
      hourlyErrorMessage=e.toString();
    }
    hourlyIsLoading=false;
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////
  String formattedTime(String time){
    DateTime dateTime=DateTime.parse(time);
    String formattedTime=DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////
  bool dailyIsLoading=false;
  String ? dailyErrorMessage;
  Future<void>getDailyWeather()async{
    dailyIsLoading=true;
    dailyErrorMessage=null;
    String url="https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto";
    try{
      var response =await http.get(Uri.parse(url));
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        dailyModel=DailyModel.fromJson(data["daily"]);
      }
      else{
        dailyErrorMessage="ERROR : ${response.statusCode}";
      }
    }
    catch(e){
      dailyErrorMessage=e.toString();
    }
    dailyIsLoading=false;
    notifyListeners();
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////
  String formattedDay (String time){
    DateTime dateTime=DateTime.parse(time);
    String formattedDay=DateFormat("EE").format(dateTime);
    return formattedDay;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////
 
}