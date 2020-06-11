import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {

  IconContent({@required this.iconText, @required this.icon});

  final String iconText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>
      [
        Icon(icon, size:80.0),
        SizedBox(height: 18.0),
        Text(iconText,style: labelTextstyle,),
      ],
    );
  }
}
