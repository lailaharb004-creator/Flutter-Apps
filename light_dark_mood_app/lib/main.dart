import 'package:flutter/material.dart';
import 'package:light_dark_mood_app/logic.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => LDMoodProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );
  }
}


class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var x=context.watch<LDMoodProvider>();
    return Scaffold(
      backgroundColor: x.backcol,
      body:Center(
          child: IconButton(onPressed: (){
            context.read<LDMoodProvider>().changeMood();
          }, icon:Icon(Icons.contrast),color: x.iconcol,iconSize: 50,),
        ),
      
    );
  }
  
}