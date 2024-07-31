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
    _updateStatus();
    _updateColor();
  }

  _updateStatus() {
    status = _getStatus();
  }

  _updateColor() {
    if (bmi < 16) {
      color = Colors.green.shade100;
    }
    if (bmi >= 16 && bmi <= 16.9) {
      color = Colors.green.shade200;
    }
    if (bmi >= 17 && bmi <= 18.4) {
      color = Colors.green.shade300;
    }
    if (bmi >= 18.5 && bmi <= 24.9) {
      color = Colors.green;
    }
    if (bmi >= 25 && bmi <= 29.9) {
      color = Colors.red.shade200;
    }
    if (bmi >= 30 && bmi <= 34.9) {
      color = Colors.red.shade400;
    }
    if (bmi >= 35 && bmi <= 39.9) {
      color = Colors.red.shade600;
    }
    if (bmi >= 40) {
      color = Colors.red.shade800;
    }
  }

  _getStatus() {
    if (bmi < 16) {
      return BMI.underweightSevere;
    }
    if (bmi >= 16 && bmi <= 16.9) {
      return BMI.underweightModerate;
    }
    if (bmi >= 17 && bmi <= 18.4) {
      return BMI.underweightMild;
    }
    if (bmi >= 18.5 && bmi <= 24.9) {
      return BMI.normal;
    }
    if (bmi >= 25 && bmi <= 29.9) {
      return BMI.overweightPre;
    }
    if (bmi >= 30 && bmi <= 34.9) {
      return BMI.obeseMild;
    }
    if (bmi >= 35 && bmi <= 39.9) {
      return BMI.obeseModerate;
    }
    if (bmi >= 40) {
      return BMI.obeseSevere;
    }
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
