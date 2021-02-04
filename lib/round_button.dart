import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import './constants.dart';

class RoundButton extends StatelessWidget {

  RoundButton({@required this.icon,@required this.onTaped});
final IconData icon;
final Function onTaped;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onTaped,
    child: Icon(icon),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    fillColor: kButtonColor,
    elevation: 6,
    constraints: BoxConstraints.tightFor(
      width:56.0,height:56.0,
    ),);
  }
}