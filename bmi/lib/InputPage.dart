import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'widgetContent.dart';
import 'constants.dart';

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

                            "MALE"

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
                    Text("HEIGHT", style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      //textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(selectedHeight.toString(), style: kNumberStyle,),
                        Text("cm", style: TextStyle(fontSize: 20),)

                      ]
                    ),
                    SliderTheme(
                      data : SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius:  15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius : 30),
                        inactiveTrackColor : Colors.grey,
                        activeTrackColor : Colors.blue,
                        thumbColor: Colors.pink,
                          overlayColor: Colors.yellow
                      ) ,
                      child: Slider(
                        min: 100,
                          max : 250,
                          value: selectedHeight.toDouble(),


                          onChanged: (double value){
                            setState(() {
                              selectedHeight =  value.round() ;
                            },);
                      }),
                    )


                  ],
                ),


                (){

                }
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      kInactiveCardColour,
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.mars),
                      ),
                        (){

                        }
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      kInactiveCardColour,
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
              color: kBottomContainerColor,
              margin: EdgeInsets.all(0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }

  void gestureDetector() {}
}
