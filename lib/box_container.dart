import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  BoxContainer({@required this.colour, this.cardChild,this.onTaped});

  final Color colour;
  final Widget cardChild;
final Function onTaped;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTaped,
          child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}