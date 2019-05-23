import 'package:flutter/material.dart';

const textStyle = TextStyle(
  color: Color(0xffB7BAC6),
);

class ReusableCardChild extends StatelessWidget {
  ReusableCardChild({@required this.icon, @required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 90.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: textStyle,
        )
      ],
    );
  }
}