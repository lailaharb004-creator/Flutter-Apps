import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Timer timer;
  @override
  void initState() {
      context.read<WeatherController>().getCurrentWeather();
      context.read<WeatherController>().getHourlyWeather();
      context.read<WeatherController>().getDailyWeather();
    super.initState();
    timer =Timer.periodic(Duration(minutes: 2),(_){
      context.read<WeatherController>().getCurrentWeather();
      context.read<WeatherController>().getHourlyWeather();
      context.read<WeatherController>().getDailyWeather();
    });

  }
  @override
  void dispose() {
    timer.cancel();
    ctr_1.dispose();
    ctr_2.dispose();
    super.dispose();
    
  }

  final ScrollController ctr_1=ScrollController();
    final ScrollController ctr_2=ScrollController();
  @override
  Widget build(BuildContext context) {
    var x=context.watch<WeatherController>();
    var currentModel=x.currentModel;
    var hourlyModel =x.hourlyModel;
    var dailyModel=x.dailyModel;
    return Scaffold(
      backgroundColor: Color(0XFF091F49), 
      body: Padding(
        padding: const EdgeInsets.all(20+.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Color(0XFF091F49),
              leading: Icon(Icons.location_on_outlined,color: Colors.white,),
              leadingWidth: 10,
              title:
  
              Text("Amman", style: TextStyle(color: Colors.white, fontSize: 15),),
              
              ),
              SizedBox(height: 10,),
            if(x.currentErrorMessage!=null)
              Text(x.currentErrorMessage ?? "ERROR")
            else if (x.currentIsLoading)
              Center(child: CircularProgressIndicator())
            else if(currentModel !=null)...[
                Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Column(
                      children: [
                        getWeatherIcon(currentModel.weatherCode,currentModel.isDay,50),
                        Text(context.read<WeatherController>().formattedTime(currentModel.time),style: TextStyle(color: Colors.white70, fontSize: 20)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("${currentModel.temperature_2m } \u00B0c", style:TextStyle(fontSize: 30,color: Colors.white,fontWeight: .bold)),
                        Text(getWeatherDesc(currentModel.weatherCode), style: TextStyle(color: Colors.white70, fontSize: 20),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    padding: .all(20),
                    decoration: BoxDecoration(
                      color:Color(0XFF0A2652),
                      borderRadius: .only(topLeft: .circular(20), topRight: .circular(20))
                    ),
                    height: .infinity,
                    width:.infinity,
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: .spaceAround,
                          children: [
                            currentInfo(Icons.water_drop,currentModel.relativeHumidity_2m,"%","Humidity"),
                            SizedBox(height:50,child: VerticalDivider(color: Color(0XFF193564),)),
                            currentInfo(Icons.wind_power_outlined,currentModel.windSpeed_10m,"km/h","Wind"),
                            SizedBox(height: 50,child: VerticalDivider(color: Color(0XFF193564),)),
                            currentInfo(Icons.thermostat,currentModel.apparentTemperature,"\u00B0c","Feels Like"),
                          ],
                        ),
                        Divider(color:Color(0XFF193564)),
                        Container(
                          height: 150,
                          padding: .all(10),
                          width:.infinity,
                          decoration: BoxDecoration(
                            color: Color(0XFF193564),
                            borderRadius: .circular(20)
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.watch_later_outlined,color: Colors.white70),
                                  SizedBox(width: 8,),
                                  Text("Today's Hourly Forecast", style: TextStyle(color: Colors.white70,fontWeight: .bold),),
                                  SizedBox(width: 10,),
                                  Icon(Icons.arrow_forward,color:  Color(0XFF3B82F6),)
                                ],
                              ),
                              if (x.hourlyErrorMessage!=null)
                                Text(x.hourlyErrorMessage ?? "ERROR")
                              else if (x.hourlyIsLoading)
                                Center(child: CircularProgressIndicator())
                              else if (hourlyModel !=null)
                                ...[
                                  SizedBox(height: 20,),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView.separated(
                                        
                                        controller: ctr_1,
                                        scrollDirection: .horizontal,
                                        itemBuilder:(context, index) {
                                          return Row(
                                            children: 
                                            [
                                              Column(
                                                spacing: 10,
                                                children: [
                                                  Text(context.read<WeatherController>().formattedTime(hourlyModel.time[index]),style: TextStyle(fontSize: 13, fontWeight: .bold,color: Colors.white70),),
                                                  getWeatherIcon(hourlyModel.weatherCode[index], hourlyModel.isDay[index],15),
                                                  Text("${hourlyModel.temperature_2m[index]}\u00B0",style: TextStyle(fontSize: 11, fontWeight: .bold,color: Colors.white70),)
                                                ],
                                              ),
                                              SizedBox(height:60,child: VerticalDivider(color: Color(0XFF3B82F6))),
                                            ],
                                          );
                                              
                                        }, 
                                        separatorBuilder:(context, index) => SizedBox(width: 10), 
                                        itemCount:24
                                        ),
                                    ),
                                  ),
                                
                        
                                ]
                                
                              
                            ],
                          ),
                          
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Container(
                            // height: .infinity,
                            padding: .all(10),
                            width:.infinity,
                            decoration: BoxDecoration(
                              color: Color(0XFF193564),
                              borderRadius: .circular(20)
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month_outlined,color: Colors.white70),
                                    SizedBox(width: 8,),
                                    Text("7-Day Forecast", style: TextStyle(color: Colors.white70,fontWeight: .bold),),
                                    SizedBox(width: 90,),
                                    
                                  ],
                                ),
                                if (x.dailyErrorMessage!=null)
                                  Text(x.dailyErrorMessage ?? "ERROR")
                                else if (x.dailyIsLoading)
                                  Center(child: CircularProgressIndicator())
                                else if (dailyModel !=null)
                                  ...[
                                    // SizedBox(height: 20,),
                                    Expanded(
                                      child: Scrollbar(
                                        controller: ctr_2,
                                        thumbVisibility: true,
                                        thickness: 2,
                                        child: ListView.separated(
                                          // scrollDirection: .horizontal,
                                          controller: ctr_2,
                                          itemBuilder:(context, index) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: .spaceAround,
                                                  children: [
                                                    Text(context.read<WeatherController>().formattedDay(dailyModel.time[index]),style: TextStyle(fontSize: 18, fontWeight: .bold,color: Colors.white70)),
                                                    getWeatherIcon(dailyModel.weatherCode[index],0,20),
                                                    Text("${dailyModel.minTempreature[index]}\u00B0 / ${dailyModel.maxTemprature[index]}\u00B0",style: TextStyle(fontSize: 13, fontWeight: .bold,color: Colors.white70))
                                                  ],
                                                ),
                                                // dailyInfo(context.read<WeatherController>().formattedDay(dailyModel.time[index]), getWeatherIcon(dailyModel.weatherCode[index],0,20), dailyModel.maxTemprature[index], dailyModel.minTempreature[index]),
                                                Divider(color:Color(0XFF3B82F6)),
                                                // Divider(color: Colors.amber,)
                                              ],
                                            );
                                                
                                          }, 
                                          separatorBuilder:(context, index) => SizedBox(width: 5,), 
                                          itemCount:dailyModel.time.length
                                          ),
                                      ),
                                    ),
                                  
                          
                                  ]
                                  
                                
                              ],
                            ),
                            
                          ),
                        )
                      ],
                    ),
                  
                  ),
                ),
              
            ],
          ],
        ),
      ),
    );
  }
}

Icon getWeatherIcon(int code, int isDay , double size){
  switch(code){
    case 0:
      return isDay ==1 ?Icon(Icons.wb_sunny , color:Colors.amber,size: size,) : Icon(Icons.nightlight_round, color:Color(0xFFA9C8FF),size: size,); 
    case 1:
      return isDay==1 ?Icon(Icons.wb_sunny_outlined,color:Colors.amber,size: size,):Icon(Icons.nightlight_round, color:Color(0xFFA9C8FF),size: size,);
    case 2:
      return isDay==1 ?Icon(Icons.wb_cloudy,color:Colors.orangeAccent,size: size,):Icon(Icons.nights_stay, color:Color(0xFFA9C8FF),size: size,);
    case 3:
      return isDay==1 ?Icon(Icons.cloud,color:Colors.blueGrey,size: size,):Icon(Icons.cloud, color:Color(0xFFA9C8FF),size: size,);
    case 45:return Icon(Icons.foggy,color:Colors.grey,size: size,);
    case 48:return Icon(Icons.foggy,color:Colors.blueGrey,size: size,);
    case 51:return Icon(Icons.grain,color:Colors.lightBlue,size: size,);
    case 53:return Icon(Icons.grain,color:Colors.lightBlueAccent,size: size,);
    case 55:return Icon(Icons.water_drop,color:Colors.blue,size: size,);
    case 56:return Icon(Icons.ac_unit,color: Colors.cyanAccent,size: size,);
    case 57:return Icon(Icons.ac_unit,color:Colors.cyan,size: size,);
    case 61:return Icon(Icons.cloudy_snowing,color:Colors.lightBlue,size: size,);
    case 63:return Icon(Icons.water,color:Colors.blue,size: size,);
    case 65:return Icon(Icons.thunderstorm,color:Colors.indigo,size: size,);
    case 66:return Icon(Icons.ac_unit,color: Colors.cyanAccent,size: size,);
    case 67:return Icon(Icons.ac_unit,color: Colors.cyan,size: size,);
    case 71:return Icon(Icons.cloudy_snowing,color:Colors.lightBlueAccent,size: size,);
    case 73:return Icon(Icons.snowing,color:Colors.lightBlue,size: size,);
    case 75:return Icon(Icons.snowing,color:Colors.white,size: size,);
    case 77:return Icon(Icons.ac_unit,color: Colors.white70,size: size,);
    case 80: return Icon(Icons.water_drop_outlined,color:Colors.lightBlue,size: size,);
    case 81:return Icon(Icons.water_drop_outlined,color:Colors.blue,size: size,);
    case 82:return Icon(Icons.thunderstorm,color:Colors.deepPurpleAccent,size: size,);
    case 85:return Icon(Icons.cloudy_snowing,color:Colors.lightBlueAccent,size: size,);
    case 86:return Icon(Icons.snowing,color:Colors.white,size: size,);
    case 95:return Icon(Icons.thunderstorm,color:Colors.deepPurple,size: size,);
    case 96:return Icon(Icons.thunderstorm,color:Colors.deepPurpleAccent,size: size,);
    case 97:return Icon(Icons.thunderstorm,color:Colors.deepPurple,size: size,);
    case 99:return Icon(Icons.thunderstorm,color:Colors.deepPurpleAccent,size: size,);
    default:return Icon(Icons.wb_sunny , color:Colors.amber,size: size,); 

    
  }
}

String getWeatherDesc(int code){
  switch(code){
    case 0:return "Clear sky"; 
    case 1:return "Mainly clear";
    case 2:return "Partly cloudy";
    case 3:return "Overcast";
    case 45:return "Fog";
    case 48:return "Rime fog";
    case 51:return "Light drizzle";
    case 53:return "Moderate drizzle";
    case 55:return "Dense drizzle";
    case 56:return "Freezing drizzle";
    case 57:return "Dense freezing drizzle";
    case 61:return "Slight rain";
    case 63:return "Moderate rain";
    case 65:return "Heavy rain";
    case 66:return "Light freezing rain";
    case 67:return "Heavy freezing rain";
    case 71:return "Slight snowfall";
    case 73:return "Moderate snowfall";
    case 75:return "Heavy snowfall";
    case 77:return "Snow grains";
    case 80:return "Slight rain showers";
    case 81:return "Moderate rain showers";
    case 82:return "Violent rain showers";
    case 85:return "Slight snow showers";
    case 86:return "Heavy snow showers";
    case 95:return "Thunderstorm";
    case 96:return "Thunderstorm with hail";
    case 97:return "Heavy thunderstorm";
    case 99:return "Thunderstorm with heavy hail";
    default:return "Clear sky"; 

    
  }
}

Column currentInfo(IconData icon ,dynamic value,String unit,String label){
  return Column(
    children: [
      Icon(icon, color: Color(0XFF3B82F6),),
      SizedBox(height: 10,),
      Text("${value.toString()} $unit",style: TextStyle(color:Colors.white,fontWeight: .bold),),
      Text(label, style: TextStyle(color: Colors.white70,fontSize: 10),)
    ],
  );
}


