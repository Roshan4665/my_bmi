import 'dart:math';
import 'dart:core';
import 'package:flutter/foundation.dart';

class Calculator {
  Calculator(
      {@required this.height, @required this.weight, this.age, this.gender});

  var height, weight, age, gender;
  double bmi = 0;

  String calculate(height, weight) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String healthParam(String sbmi) {
    double bmi = double.parse(sbmi);
    if (bmi > 35)
      return 'Severly Obese';
    else if (bmi > 25)
      return 'Overweight';
    else if (bmi > 18)
      return 'Normal';
    else if (bmi > 16)
      return 'Underweight';
    else
      return 'Severly Underweight';
  }
}
