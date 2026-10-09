import 'package:counter_app/logic.dart';
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
    return ChangeNotifierProvider(create:(context) => CounterProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    )
    ,);
  }
}
class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var x=context.watch<CounterProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          Text("Counter App", style: TextStyle(fontSize: 30,color: Colors.white)),
          Text(x.counter.toString(), style: TextStyle(fontSize: 200, fontWeight: .bold, color: Colors.amber),),
          Row(
            spacing:5,
            mainAxisAlignment: .spaceAround,
            children: [
              Container(
                width: 80,height: 80,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: .circular(50)
                ),
                child: IconButton(onPressed: (){context.read<CounterProvider>().decrement();}, icon: Icon(Icons.remove), color: Colors.white,)
                ),
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 60, 60, 60),
                    borderRadius:.circular(50)
                  ),
                  child: IconButton(onPressed: (){context.read<CounterProvider>().reset();}, icon: Icon(Icons.history), color: Colors.white,)
                ),
                Container(
                  width: 80,height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: .circular(50)
                  ),
                  child: IconButton(onPressed: (){context.read<CounterProvider>().increment();}, icon: Icon(Icons.add) , color: Colors.white,))
            ],
          )
        ],
      ),

    );
  }
  
}
