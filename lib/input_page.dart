import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './box_container.dart';
import './card_items.dart';

const bottomContainerHeight = 80.0;
const activeColor = Color(0xFF0D47A1);
const inactiveColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: BoxContainer(
                    colour: selectedGender==Gender.male?activeColor:inactiveColor,
                    cardChild: CardItems(
                      icon: FontAwesomeIcons.male,
                      text: "MALE",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: BoxContainer(
                    colour: selectedGender==Gender.female?activeColor:inactiveColor,
                    cardChild: CardItems(
                      icon: FontAwesomeIcons.female,
                      text: "FEMALE",
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: BoxContainer(colour: inactiveColor),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxContainer(colour: inactiveColor),
                ),
                Expanded(
                  child: BoxContainer(colour: inactiveColor),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
            child: Center(child: Text("Calculate")),
          ),
        ],
      ),
    );
  }
}
