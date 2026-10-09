import 'package:flutter/material.dart';
import 'package:like_button_app/logic.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => LikeButtonProvider(),
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
    var x=context.watch<LikeButtonProvider>();
    return Scaffold(
      body: Center(
        child:Row(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text(x.counter.toString(), style: TextStyle(fontSize: 80),),
            IconButton(onPressed: (){
              context.read<LikeButtonProvider>().changeColor();
            }, icon:Icon(Icons.favorite ,size: 100,color: x.col,)
            ),
          ],
      )
      ),
    );

  }
  
}