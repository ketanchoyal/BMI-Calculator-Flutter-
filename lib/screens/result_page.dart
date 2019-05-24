import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.result, @required this.interpretation, @required this.bmiValue});

  final String result;
  final String interpretation;
  final String bmiValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
//              padding: EdgeInsets.all(20.0),
              child: Text(
                'Your Result',
                style: kTitleTextStyle
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    result.toUpperCase(),
                    style: kResultTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    bmiValue,
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      interpretation,
                      style: kBMISuggestionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
