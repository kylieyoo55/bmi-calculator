import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
BottomButton({this.onTaped,this.labelText});

 final Function onTaped;
 final String labelText;
   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Container(
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom:20),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(child: Text(labelText, style: kBottomLabelstyle)),
      ),
    );
  }
}
