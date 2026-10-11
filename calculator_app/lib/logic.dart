import 'package:flutter/material.dart';

class CalcProvider extends ChangeNotifier{
  TextEditingController ctr=TextEditingController();
  String operand1="";
  String operand2="";
  String operator ="";
  String text="";
  double result=0;

  void filled(String op){
    if(ctr.text !=""){
      choosedOperator(op);
    }
  }
  void choosedOperator(String op){
    
    if (op == "=" ){
      
          if (operator=="*"){
          multi();
        }
        else if (operator=="/"){
          division();
        }
        else if (operator=="+"){
          sum();
        }
        else if (operator=="-"){
          sub();
        }
     
        
        operator=op;
        
        
    }
    else if (op =="+" || op =="-" || op =="*" || op =="/" ){
      if (operator ==""){
        operand1=ctr.text;
        text+=ctr.text;
        notifyListeners();
        ctr.clear();
        operator=op;
        text+=operator;
      
      }
      
      else{
        
        if (operator=="*"){
          multi();
        }
        else if (operator=="/"){
          division();
        }
        else if (operator=="+"){
          sum();
        }
        else if (operator=="-"){
          sub();
        }
        operator=op;
        text+=operator;
      }
    }
    notifyListeners();
  }


  
  void num1(){
    ctr.text+="1";
    notifyListeners();
  }
  void num2(){
    ctr.text+="2";
    notifyListeners();

  }
  void num3(){
    ctr.text+="3";
    notifyListeners();

  }
  void num4(){
    ctr.text+="4";
    notifyListeners();

  }
  void num5(){
    ctr.text+="5";
    notifyListeners();

  }
  void num6(){
    ctr.text+="6";
    notifyListeners();

  }
  void num7(){
  ctr.text+="7";
  notifyListeners();

  }
  void num8(){
    ctr.text+="8";
    notifyListeners();

  }
  void num9(){
    ctr.text+="9";
    notifyListeners();

  }
  void num0(){
    ctr.text+="0";
    notifyListeners();

  }
  void multi(){
    operand2=ctr.text;
    text+=ctr.text;
    result=double.parse(operand1)*double.parse(operand2);
    text=result.toString();
    operand1=result.toString();
    ctr.clear();
  }
  void division(){
    operand2=ctr.text;
    text+=ctr.text;
    // if (double.parse(operand2)==0){
    //   try {

    //   }
    //   catch 
    // }
    result=double.parse(operand1)/double.parse(operand2);
    text=result.toString();
    operand1=result.toString();
    ctr.clear();
  }
  void sum(){
    operand2=ctr.text;
    text+=ctr.text;
    result=double.parse(operand1)+double.parse(operand2);
    text=result.toString();
    operand1=result.toString();
    ctr.clear();
  }
  void sub(){
    operand2=ctr.text;
    text+=ctr.text;
    result=double.parse(operand1)-double.parse(operand2);
    text=result.toString();
    operand1=result.toString();
    ctr.clear();
  }
  void clear(){
    operand1="";
    operand2="";
    operator ="";
    result=0;
    text="";
    ctr.clear();
    notifyListeners();
  }
  void dot(){
    if (!ctr.text.contains(".")){
      ctr.text+=".";
    }
    notifyListeners();
  }
  void backspace(){
    if(ctr.text!=""){
      ctr.text=ctr.text.substring(0,ctr.text.length-1);
    }
    notifyListeners();
  }


}