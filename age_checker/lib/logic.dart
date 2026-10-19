import 'package:flutter/material.dart';

class AgeCheckerProvider extends ChangeNotifier{
  TextEditingController ctr=TextEditingController();
  String text="";
  void checkAge (){
    
    double ? age =double.tryParse(ctr.text);
      if(age !=null && age >=0){
        if(age>=0 && age<=12) {
        text="You are child";
        
        }
        else if(age >=13 && age <=17){
          text="You are teen";
        }
        else{
          text="You are adult";
        }
      }
      else{
        text="Illegale Age";
      }
        
    ctr.clear();
    notifyListeners();
}
}