import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMIHome extends StatefulWidget {
  const BMIHome({super.key});

  @override
  State<BMIHome> createState() => _BMIHomeState();
}

class _BMIHomeState extends State<BMIHome> {
  double heightValue = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
    );
  }
}
