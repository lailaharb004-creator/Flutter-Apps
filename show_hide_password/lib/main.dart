import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_hide_password/logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => SHPassword(),
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
    var x =context.watch<SHPassword>();
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 380,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: .circular(20)),
              suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.visibility)
                )
            ),
          )
        ),
      )
    );
  }
  
}