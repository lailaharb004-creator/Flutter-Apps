import 'package:flutter/material.dart';

class LDMoodProvider extends ChangeNotifier{
  bool isChecked=false;
  Color backcol=Colors.white;
  Color iconcol=Colors.black;
  void changeMood(){
    isChecked=!isChecked;
    
    if(isChecked){
      backcol=Colors.black;//const Color.fromARGB(255, 62, 61, 61);
      iconcol=Colors.white;
      
    }
    else{
      backcol=Colors.white;
      iconcol=Colors.black;
    }
    notifyListeners();
  }
}