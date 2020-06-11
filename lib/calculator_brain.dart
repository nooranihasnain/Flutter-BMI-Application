import 'dart:math';

class CalculatorBrain
{
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String CalculateBMI()
  {
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String GetResult()
  {
    if(_bmi>=25)
    {
      return 'Overweight';
    }
    else if(_bmi > 18.5)
    {
      return 'Normal';
    }
    else
    {
      return 'Underweight';
    }
  }

  String GetInterpretation()
  {
    if(_bmi>=25)
    {
      return 'Try exercising, you fat human';
    }
    else if(_bmi > 18.5)
    {
      return 'You are good, chill';
    }
    else
    {
      return 'Eat more mate or else you will fly away someday';
    }
  }
}