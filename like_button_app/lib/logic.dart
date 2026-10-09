import 'package:flutter/material.dart';

class LikeButtonProvider extends ChangeNotifier{
  bool isClicked=false;
  Color col=Colors.black;
  
  int counter=0;
  void changeColor(){
    isClicked=!isClicked;
    if(isClicked){
      col=Colors.redAccent;
      counter++;
    }
    else{
      col=Colors.black;
      counter --;
    
    }
    notifyListeners();
  }
}