import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'widgetContent.dart';
import 'constants.dart';
import 'results_page.dart';
import 'BottomButton.dart';
import 'package:bmi/Calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;
  Gender selectedGender;
  int selectedHeight = 150;
  int selectedWeight = 60;
  int selectedAge = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        (Gender.male == selectedGender)
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        widgetContent(
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 100,
                            ),
                            "MALE"), () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                          print("print111");
                        },
                      );
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                      (Gender.female == selectedGender)
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      widgetContent(
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                        ),
                        "FEMALE",
                      ),
                      () {
                        setState(() {
                          selectedGender = Gender.female;
                          print("print222");
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  kInactiveCardColour,
                  Column(
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
                              selectedHeight.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              "cm",
                              style: TextStyle(fontSize: 20),
                            )
                          ]),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            inactiveTrackColor: Colors.grey,
                            activeTrackColor: Colors.blue,
                            thumbColor: Colors.pink,
                            overlayColor: Colors.yellow),
                        child: Slider(
                            min: 100,
                            max: 250,
                            value: selectedHeight.toDouble(),
                            onChanged: (double value) {
                              setState(
                                () {
                                  selectedHeight = value.round();
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                  () {}),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kInactiveCardColour,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT", style: kLabelTextStyle),
                            Text(
                              selectedWeight.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    if (selectedWeight < 65) selectedWeight++;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    if (selectedWeight > 55) selectedWeight--;
                                  });
                                }),
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kInactiveCardColour,
                        Column(
                          children: [
                            Text('AGE', style: kLabelTextStyle),
                            Text(selectedAge.toString(), style: kNumberStyle),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                selectedAge++;
                              });
                            }),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                selectedAge--;
                              });
                            })
                          ],
                        ),
                        () {}),
                  ),
                ],
              ),
            ),
            BottomButton( "Result" , (){
              CalculatorBrain cb = CalculatorBrain(this.selectedAge,  this.selectedWeight);



              Navigator.pushNamed(context, '/result_page' );
            } )
          ],
        ));
  }

  void gestureDetector() {}
}


class RoundIconButton extends StatelessWidget {
  final IconData child;
  final Function selected_action;

  RoundIconButton(@required this.child, this.selected_action) {}

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: CircleBorder(),
        fillColor: Colors.white,
        elevation: 30.0,
        focusElevation: 4.0,
        child: Icon(
          this.child,
          color: Colors.black,
        ),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        onPressed: () {
          this.selected_action();
        });
  }
}
