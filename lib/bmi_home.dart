import 'package:bmi_calculator/bmi_provider.dart';
import 'package:bmi_calculator/components/bmi_result.dart';
import 'package:bmi_calculator/components/bmi_slider.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMIHome extends StatelessWidget {
  const BMIHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Consumer<BMIProvider>(
            builder: (context, provider, child) => BMISlider(
              label: "Height",
              unit: BMIUnit.m,
              sliderValue: provider.heightValue,
              sliderDivision: 100,
              sliderMax: 2.2,
              sliderMin: 1.2,
              onchanged: (newValue) {
                provider.changeHeight(newValue);
              },
            ),
          ),
          Consumer<BMIProvider>(
            builder: (context, provider, child) => BMISlider(
              label: "Weight",
              unit: BMIUnit.kg,
              sliderValue: provider.weightValue,
              sliderDivision: 200,
              sliderMax: 150,
              sliderMin: 25,
              onchanged: (newValue) {
                provider.changeWeight(newValue);
              },
            ),
          ),
          Expanded(
            child: Consumer<BMIProvider>(
              builder: (context, provider, child) => BMIResult(
                color: provider.color,
                bmi: provider.bmi,
                status: provider.status,
              ),
            ),
          )
        ],
      ),
    );
  }
}
