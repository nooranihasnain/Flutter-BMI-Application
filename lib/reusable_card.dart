import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  
  final Color cardColor;
  final Widget cardChild;
  final Function onPressed;

  ReusableCard({@required this.cardColor, this.cardChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
      onTap: onPressed,
      child: Container
      (
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration
        (
          color: cardColor  ,
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}