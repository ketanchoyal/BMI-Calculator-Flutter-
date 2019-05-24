import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: RawMaterialButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}