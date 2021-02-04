import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../componenets/box_container.dart';
import '../componenets/card_items.dart';
import '../constants.dart';
import '../componenets/round_button.dart';
import './results_page.dart';
import '../componenets/bottom_button.dart';
import '../calculator_brain.dart';

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

  void _onTaped(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  int height = 180;
  int weight = 64;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    Widget weightAndAge(String label, int number) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: kLabelTextStyle,
          ),
          Text(number.toString(), style: kSmallNumberStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                icon: Icons.add,
                onTaped: () {
                  setState(() {
                    number++;
                  });
                },
              ),
              SizedBox(width: 10),
              RoundButton(
                icon: Icons.remove,
                onTaped: () {
                  setState(() {
                    number--;
                  });
                },
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: BoxContainer(
                  colour: selectedGender == Gender.male
                      ? kActiveColor
                      : kInactiveColor,
                  cardChild: CardItems(
                    icon: FontAwesomeIcons.male,
                    text: "MALE",
                  ),
                  onTaped: () => _onTaped(Gender.male),
                ),
              ),
              Expanded(
                child: BoxContainer(
                  colour: selectedGender == Gender.female
                      ? kActiveColor
                      : kInactiveColor,
                  cardChild: CardItems(
                    icon: FontAwesomeIcons.female,
                    text: "FEMALE",
                  ),
                  onTaped: () => _onTaped(Gender.female),
                ),
              ),
            ]),
          ),
          Expanded(
            child: BoxContainer(
              colour: kInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightTextStyle,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 230,
                      // activeColor: Colors.pink,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double nv) {
                        setState(() {
                          height = nv.round();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxContainer(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toString(), style: kSmallNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: Icons.add,
                              onTaped: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              icon: Icons.remove,
                              onTaped: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BoxContainer(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(age.toString(), style: kSmallNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: Icons.add,
                              onTaped: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              icon: Icons.remove,
                              onTaped: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(onTaped: () {
CalculatorBrain calc= CalculatorBrain(height: height,weight: weight);

        Navigator.push(
          context,
          MaterialPageRoute(
            
            builder: (ctx) => ResultsPage(
              bmi: calc.calculateBMI(),
              label:calc.getResultLabel(),
              interpre: calc.getResultInterpre(),
            ),
          ),
        );
      },labelText: "CALCULATE",),
        ],
      ),
    );
  }
}
