import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       body:Center(
  //         child: Stack(
  //           alignment: .center,
  //           children: [
  //             Container(
  //               width: 380,
  //               height: 100,
  //               decoration: BoxDecoration(
  //                 color: const Color.fromARGB(255, 134, 163, 213),
  //                 borderRadius: .circular(20)
  //               ),
  //             ),
  //             Icon(Icons.alarm , color: const Color.fromARGB(255, 108, 142, 159),size: 30,)
  //           ],
  //         ),
  //       )
  //     ),
  //   );
  // }
/////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       body:Center(
  //         child: Stack(
  //           alignment: .center,
  //           children: [
  //             Container(
  //               width: 380,
  //               height: 100,
  //               decoration: BoxDecoration(
  //                 color: const Color.fromARGB(255, 134, 163, 213),
  //                 borderRadius: .circular(20)
  //               ),
  //             ),
  //             SizedBox(width: 250,child: TextField(decoration: InputDecoration(border: OutlineInputBorder()),))
  //           ],
  //         ),
  //       )
  //     ),
  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Center(
          child: Stack(
            alignment: .center,
            children: [
            
              SizedBox(width: 250,child: TextField(decoration: InputDecoration(border: OutlineInputBorder()),)),
              ElevatedButton(onPressed: (){}, child: Text("Front of TextField"))
            ],
          ),
        )
      ),
    );
  }
}
      