import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_card_child.dart';
import 'constants.dart';

enum Gender {
  Male,
  Female
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'BMI CALCULATOR'
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                      },
                      colour: selectedGender == Gender.Male ? kActiveCardColor : kInactiveCardColor,
                      cardChild: new ReusableCardChild(
                        icon: FontAwesomeIcons.mars,
                        title: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      colour: selectedGender == Gender.Female ? kActiveCardColor : kInactiveCardColor,
                      cardChild: ReusableCardChild(
                        icon: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFFB7BAC6),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0,disabledThumbRadius: 8.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          max: 250.0,
                          min: 120.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                    color: kButtonContainerColor,
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'CALCULATE YOUR BMI',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.onPressed, @required this.icon});

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      fillColor: Color(0xff212747),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
    );
  }
}

