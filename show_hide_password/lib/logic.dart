import 'package:flutter/material.dart';

class SHPasswordProvider extends ChangeNotifier{
  TextEditingController ctr=TextEditingController();
  String hideText="";
  String showedText="";
  String result="";
  bool isClicked=false;
  List<Widget>dots=[];
  void showHide(){
    
    isClicked=!isClicked;
    if(isClicked){
      showedText=ctr.text;
      hideText="";
      for(int i=0;i<ctr.text.length;i++){
        hideText+=".";
      }
      
      result=hideText;
      
    }
    else{
      result=showedText;
    }
    ctr.text=result;
    notifyListeners();
  }
  
}