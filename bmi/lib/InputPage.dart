import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'widgetContent.dart';

const bottomContainerHeight = 40.0;
const bottomContainerColor = Colors.pink;

const inactiveCardColour = Color(0xFF1D1E33);
const activeCardColour = Colors.pink;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;
  Gender selectedGender;

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
                            ? activeCardColour
                            : inactiveCardColour,
                        widgetContent(
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 100,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(fontSize: 30),
                          ),
                        ), () {
                      setState(() {
                        selectedGender = Gender.male;
                          print("print111");
                        },
                      );
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                      (Gender.female == selectedGender)
                          ? activeCardColour
                          : inactiveCardColour,
                      widgetContent(
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(fontSize: 30),
                        ),
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
                inactiveCardColour,
                Text("nothing"),
                  (){

                  }
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      inactiveCardColour,
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.mars),
                      ),
                        (){

                        }
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      inactiveCardColour,
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.venus),
                      ),
                        (){

                        }
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.all(0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }

  void gestureDetector() {}
}
