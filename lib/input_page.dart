import 'package:bmi_calculator/bottom_button.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender gender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 19;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded
          (
            child: Row
            (
              children: <Widget>
              [
                Expanded
                (
                  child:ReusableCard
                  (
                    cardColor: gender == Gender.male ? activeCardColor : inactiveCardColor,
                    cardChild: IconContent
                    (
                      icon: FontAwesomeIcons.mars,
                      iconText: 'MALE',
                    ),
                    onPressed: ()
                    {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                  )
                ),
                Expanded
                (
                  child:ReusableCard
                  (
                    cardColor: gender == Gender.female ? activeCardColor : inactiveCardColor,
                    cardChild: IconContent
                    (
                      icon: FontAwesomeIcons.venus,
                      iconText: 'FEMALE',
                    ),
                    onPressed: ()
                    {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                  )
                )
              ],
            )
          ),
          Expanded
          (
            child: ReusableCard
            (
              cardColor: activeCardColor,
              cardChild: Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>
                [
                  Text('HEIGHT', style: labelTextstyle,),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>
                    [
                      Text
                      (
                        height.toString(),
                        style: boldTextstyle,
                      ),
                      Text
                      (
                        'cm',
                        style: labelTextstyle,
                      )
                    ],
                  ),
                  SliderTheme
                  (
                    data: SliderTheme.of(context).copyWith
                    (
                      inactiveTrackColor:Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:   RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),  
                    ),  
                    child: Slider
                    (
                      min: 120.0,
                      max: 420.0,
                      value: height.toDouble(),
                      onChanged: (double newValue)
                      {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ), 
          ),
          Expanded
          (
            child: Row
            (
              children: <Widget>
              [
                Expanded
                (
                  child:ReusableCard
                  (
                    cardColor: activeCardColor,
                    cardChild: Column
                    (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>
                      [
                        Text('WEIGHT', style: labelTextstyle,),
                        Text(weight.toString(), style: boldTextstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton
                            (
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton
                            (
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ),
                Expanded
                (
                  child:ReusableCard
                  (
                    cardColor: activeCardColor,
                    cardChild: Column
                    (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>
                      [
                        Text('AGE', style: labelTextstyle,),
                        Text(age.toString(), style: boldTextstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton
                            (
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton
                            (
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                )
              ],
            )
          ),
          BottomButton
          (
            buttonTitle: 'CALCULATE', 
            onTap: ()
            {
              CalculatorBrain cb = new CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ResultPage
              (
                bmiResult: cb.CalculateBMI(),
                bmiText: cb.GetResult(),
                interpretation: cb.GetInterpretation(),
              )));
            }
          )
        ],
      )
    );
  }
}


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton
    (
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}