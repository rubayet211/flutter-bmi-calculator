import 'package:bmi_calculator/components/bmi_result.dart';
import 'package:bmi_calculator/components/bmi_slider.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMIHome extends StatefulWidget {
  const BMIHome({super.key});

  @override
  State<BMIHome> createState() => _BMIHomeState();
}

class _BMIHomeState extends State<BMIHome> {
  double heightValue = 1.5;
  double weightValue = 50.0;
  String status = '';
  double bmi = 0.0;
  Color color = Colors.green;

  _updateBMI() {
    bmi = weightValue / (heightValue * heightValue);
  }

  @override
  void initState() {
    _updateBMI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          BMISlider(
            label: "Height",
            unit: BMIUnit.m,
            sliderValue: heightValue,
            sliderDivision: 100,
            sliderMax: 2.2,
            sliderMin: 1.2,
            onchanged: (newValue) {
              setState(() {
                heightValue = newValue;
              });
              _updateBMI();
            },
          ),
          BMISlider(
            label: "Weight",
            unit: BMIUnit.kg,
            sliderValue: weightValue,
            sliderDivision: 200,
            sliderMax: 150,
            sliderMin: 25,
            onchanged: (newValue) {
              setState(() {
                weightValue = newValue;
              });
              _updateBMI();
            },
          ),
          Expanded(
            child: BMIResult(
              color: color,
              bmi: bmi,
              status: status,
            ),
          )
        ],
      ),
    );
  }
}
