
import 'dart:math';

class CalculatorBrain{
CalculatorBrain({this.height,this.weight});

  final int weight;
  final int height;
  double _bmi;

String calculateBMI(){
  _bmi= weight/pow(height/100,2);
  return _bmi.toStringAsFixed(1);
}

String getResultLabel(){
  if(_bmi >=25){
    return"OVERWEIGHT";
  }else if(_bmi >18.8){
    return "NORMAL";
  }else{return "UNDER-WEIGHT";
  }
}

String getResultInterpre(){
  if(_bmi >=25){
    return"You have a higher than normal body weight";
  }else if(_bmi >18.8){
    return "Your gorgeous, keep it up!";
  }else{return "You should feed yourself more, anyway your still gorgeous";
  }
}
}