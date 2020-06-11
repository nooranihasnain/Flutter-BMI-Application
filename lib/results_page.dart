import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmiResult, this.bmiText, this.interpretation});

  final String bmiResult;
  final String bmiText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(title: Text('BMI Calculator'),centerTitle: true,),
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>
        [
          Expanded
          (
            child: Container
            (
              margin: EdgeInsets.only(top:30.0),
              child: Text('YOUR RESULT', style: titleTextStyle, textAlign: TextAlign.center,),
            )
          ),
          Expanded
          (
            flex: 5,
            child: ReusableCard
            (
              cardColor: activeCardColor,
              cardChild: Column
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Text(bmiText, style: resultTextStyle,),
                  Text(bmiResult, style: bmiTextStyle,),
                  Text(
                    interpretation, style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Container
            (
              child: Center(
                child: Text('RECALCULATE', style: largeButtonTextStyle,)
              ),
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: bottomContainerHeight
            ),
          )
        ],
      ),
    );
  }
}