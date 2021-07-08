import 'package:flutter/material.dart';
import 'dart:math';

class CalcBrain {
  CalcBrain({@required this.height, @required this.weight});

  final int weight;
  final int height;
  double _bmi;

  String calculatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return ' Normal';
    } else {
      return 'Underweight';
    }
  }

  String gethelp() {
    if (_bmi >= 25) {
      return 'You have higher than normal body.Try more exercise';
    } else if (_bmi > 18.5) {
      return ' you have normal body weight.Good job!';
    } else {
      return 'you have a lower than normal body weight.You have eat a bit more';
    }
  }
}
