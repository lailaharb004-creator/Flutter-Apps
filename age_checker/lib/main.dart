import 'package:age_checker/logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => AgeCheckerProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage()
    ),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var x =context.watch<AgeCheckerProvider>();
    return Scaffold(
      backgroundColor: Color(0XFFfbfcfe),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image.asset("assets/images/calendar.png", width: 160,height: 160,),
            Text("Age Checker", 
            style:GoogleFonts.nunito(
              fontWeight: .bold,
              fontSize: 40,
              color: const Color.fromARGB(255, 25, 66, 100)
              ),
            ),
            Text("Enter your age and fit out",
              style:GoogleFonts.nunito(
                fontWeight: .bold,
                color: Colors.black54
              )
            ),
            Text("which category you belong to.",
              style:GoogleFonts.nunito(
                fontWeight: .bold,
                color: Colors.black54
              )
            ),
            SizedBox(height: 50,),
            SizedBox(
              width:350,
              child: Text("Your Age", 
                style:GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: .bold,
                  color: const Color.fromARGB(255, 25, 66, 100)
                )
              ),
            ),
            SizedBox(
              width:350,
              height:50,
              child: TextField(
                controller: x.ctr,
                decoration:InputDecoration(
                  
                  prefixIcon: Icon(Icons.person_outline ,size: 20,color:Colors.black45 ,fontWeight: .bold,),
                  hintText: "Enter your age",
                  hintStyle: TextStyle(color: Colors.black45 ,fontWeight: .bold , fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: .circular(15)
                  )
                ),
              )
            ),
            MaterialButton(
              minWidth: 350,
              height: 50,
              color: const Color.fromARGB(255, 83, 107, 184),
              shape: RoundedRectangleBorder(
                borderRadius: .circular(50)
              ),
              onPressed: (){
                context.read<AgeCheckerProvider>().checkAge();
              }, 
              child: Text("Check" ,
              style:GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: .bold,
                color: Colors.white70
              )
              )
            ),
            
            Container(
              width: 350,
              height: 300,
              padding: .all(30),
              decoration: BoxDecoration(
                color: Color(0XFFf1f5fd),
                borderRadius: .circular(50)
              ),
              child: Column(
                spacing: 10,
                children: [
                  Text("Result",
                  style:GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: .bold,
                  color: Color(0XFFb4bcd7)
                  )
                  ),
                  Text(x.text, 
                    style:GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: .bold,
                      color: Colors.red
                  )
                  ,),
                  Row(
                    mainAxisAlignment: .spaceAround,
                    children: [
                      
                      getContainer(Color(0XFFd1f6e8),Color(0XFF276353),"assets/images/boy.png", "Child", "(0 - 12)"),
                      getContainer(Color(0XFFfeebc7),Color(0XFF8a622e) ,"assets/images/student.png", "Teen", "(13 - 17)"),
                      getContainer(Color(0XFFd8d7f2),Color(0XFF48386a) ,"assets/images/avatar.png", "Adult", "(+18)")
                    
                    ],
                  )
                ],
              ),
            )
        
          ],
        ),
      )
    );
  }
  
}

Container getContainer(Color colorOne, Color colorTwo, String image , String textOne , String textTwo){
  return Container(
    
    padding: .all(20),
    decoration: BoxDecoration(
      color: colorOne,
      borderRadius: .circular(20),
      
    
    ),
    
    child: Column(
      children: [
        Image.asset(image , width: 50, height: 50,),
        Text(textOne, style:TextStyle(color: colorTwo , fontWeight: .bold),),
        Text(textTwo, style: TextStyle(color: Colors.black38),),
      ],
    ),
  );
}
