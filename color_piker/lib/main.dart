import 'package:color_piker/logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => ColorPikerProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    ),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var x=context.watch<ColorPikerProvider>();
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Container(
              width: 380,
              height: 200,
              decoration: BoxDecoration(
                color: x.contColor,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  MaterialButton(onPressed: (){context.read<ColorPikerProvider>().amber();}, color: Colors.amberAccent,minWidth: 50,shape: RoundedRectangleBorder(borderRadius: .circular(20)),),
                  MaterialButton(onPressed: (){context.read<ColorPikerProvider>().red();}, color: Colors.red,minWidth: 50,shape: RoundedRectangleBorder(borderRadius: .circular(20)),),
                  MaterialButton(onPressed: (){context.read<ColorPikerProvider>().brown();}, color: Colors.brown,minWidth: 50,shape: RoundedRectangleBorder(borderRadius: .circular(20)),),
                  
                ],
              ),
            ),
            ElevatedButton(onPressed: (){context.read<ColorPikerProvider>().reset();},style:ButtonStyle(backgroundColor:.all(Colors.blueGrey)),child: Text("Reset", style: TextStyle(color: Colors.white, fontWeight: .bold),))

            
          ],
        ),
      )
    );
  }
  
}
      