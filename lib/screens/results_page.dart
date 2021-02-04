import '../componenets/bottom_button.dart';
import '../componenets/box_container.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmi,@required this.interpre,@required this.label});
  final String bmi;
final String label;
final String interpre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Your Result",
                style: kMedTitleText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(bottom:15),
                color: kInactiveColor,
                child: BoxContainer(
                  colour: kInactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(label, style: kResultStateText),
                      Text(
                        "24.5",
                        style: kBigTitleText,
                      ),
                      Text(
                        interpre,
                        textAlign: TextAlign.center ,
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
            
            child: BottomButton(
            onTaped: (){
              Navigator.pop(context);
            },
            labelText: "RE-CALCULATE",
          )),
        ],
      ),
    );
  }
}
