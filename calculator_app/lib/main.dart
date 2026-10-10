import 'package:calculator_app/logic.dart';
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
    return ChangeNotifierProvider(create:(context) => CalcProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );
  }
}


/////////////////////////////////////////////////////
class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var x=context.watch<CalcProvider>();
    return Scaffold(
      backgroundColor: Color(0XFF0F172A),
      body:Column(
        children: [
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35 ),
            
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.calculate_outlined, color: Colors.white,size:30 ,),
                Text("Calculator",style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: .bold),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0XFF1E293B),
              borderRadius: .circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: .none)),controller:x.ctr,style: TextStyle(fontSize: 30,color: Colors.white),),
                  Align(alignment: .centerLeft,child: Text( x.text, style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: .bold))),
                ],
              ),
            ),
          ),
          SizedBox(height: 70,),
          Container(
            
            decoration: BoxDecoration(
      
            ),
            child: Column(
              spacing: 15,
              children: [
                  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: .spaceAround,
              crossAxisAlignment: .center,
              children: [
                MaterialButton(onPressed: (){context.read<CalcProvider>().clear();},minWidth: 120,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15),color: Color(0XFF1E293B),child: Text("C", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: .bold),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().backspace();},minWidth: 120,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(20),color: Color(0XFF1E293B),child: Icon(Icons.backspace, color: Colors.white,size: 30,),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().choosedOperator("/");},shape:RoundedRectangleBorder(borderRadius: .circular(20)), padding: .all(20),color: Color(0XFFF59E0B),child: Icon(Icons.percent ,color: Colors.white,size: 30,) ,),
              ],
            ),
                      ),
                      Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: .spaceAround,
              children: [
                MaterialButton(onPressed: (){context.read<CalcProvider>().num7();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("7",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().num8();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("8",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().num9();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("9",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().choosedOperator("*");},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(20) , color: Color(0XFFF59E0B),child: Text("x",style: TextStyle(fontSize: 25, fontWeight: .bold, color: Colors.white),)),
            
              ],
            ),
                      ),
                      Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: .spaceAround,
              crossAxisAlignment: .center,
              children: [
                MaterialButton(onPressed: (){context.read<CalcProvider>().num4();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("4",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().num5();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("5",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().num6();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("6",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().choosedOperator("-");},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(20) , color: Color(0XFFF59E0B),child: Icon(Icons.remove,color: Colors.white,size: 30,),)
            
              ],
            ),
                      ),
                      Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: .spaceAround,
              crossAxisAlignment: .center,
              children: [
                MaterialButton(onPressed: (){context.read<CalcProvider>().num1();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("1",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().num2();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("2",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().num3();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("3",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().choosedOperator("+");},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(20) , color: Color(0XFFF59E0B),child: Icon(Icons.add ,color: Colors.white,size: 30,),),
            
              ],
            ),
                      ),
                      Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: .spaceAround,
              crossAxisAlignment: .center,
              children: [
                MaterialButton(onPressed: (){context.read<CalcProvider>().num0();},minWidth: 170,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text("0",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().dot();},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF1E293B),child: Text(".",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
                MaterialButton(onPressed: (){context.read<CalcProvider>().choosedOperator("=");},minWidth: 80,shape:RoundedRectangleBorder(borderRadius: .circular(20)),padding: .all(15) , color: Color(0XFF10B981),child: Text("=",style: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.white),),),
              ],
            ),
                      )
              ],
            ),
          ),
        
      
        ],
      )
    );
  }
  
}