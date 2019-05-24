import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.title});

  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
          color: kButtonContainerColor,
        ),
        padding: EdgeInsets.only(bottom: 10.0),
        child: RawMaterialButton(
          onPressed: onTap,
          child: Center(
            child: Text(
              title,
              style: kLargeTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}