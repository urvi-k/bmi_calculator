import 'dart:math';

class BmiCalculation {

  final int height;
  final int weight;
  double _bmi;

  BmiCalculation({this.weight,this.height});

  String calculateBmi() {
    print("h------$height---w---$weight");
    _bmi = weight / pow((height / 100),2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeighted';
    }else if (_bmi > 18.5) {
      return 'Normal';
    }else {
      return 'UnderWeighted';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Tame jadya 6o.';
    }else if (_bmi > 18.5) {
      return 'Tame barabr 6o.';
    }else {
      return 'Tame titoda 6o.';
    }
  }

 }