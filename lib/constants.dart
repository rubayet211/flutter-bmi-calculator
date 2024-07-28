import 'package:flutter/material.dart';

const backgroundColor = Colors.lightBlueAccent;
const textLabelStyle = TextStyle(
  color: Colors.white70,
  fontSize: 22,
);

const textValueStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
);

abstract final class BMI {
  static const String underweightSevere = 'Underweight Severe';
  static const String underweightModerate = 'Underweight Moderate';
  static const String underweightMild = 'Underweight Mild';
  static const String normal = 'Normal';
  static const String overweightPre = 'Overweight (Pre-obese)';
  static const String obeseMild = 'Obese Mild';
  static const String obeseModerate = 'Obese Moderate';
  static const String obeseSevere = 'Obese Severe';
}

enum BMIUnit { m, ft, kg, lb }
