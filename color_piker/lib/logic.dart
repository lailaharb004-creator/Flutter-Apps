import 'package:flutter/material.dart';

class ColorPikerProvider extends ChangeNotifier{
  Color contColor=Colors.blueGrey;
  void amber(){
    contColor=Colors.amber;
    notifyListeners();
  }
  void red(){
    contColor=Colors.red;
    notifyListeners();
  }
  void brown(){
    contColor=Colors.brown;
    notifyListeners();
  }
  void reset(){
    contColor=Colors.blueGrey;
    notifyListeners();
  }
}