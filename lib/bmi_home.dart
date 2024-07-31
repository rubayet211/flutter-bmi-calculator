import 'package:bmi_calculator/bmi_provider.dart';
import 'package:bmi_calculator/components/bmi_result.dart';
import 'package:bmi_calculator/components/bmi_slider.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMIHome extends StatefulWidget {
  const BMIHome({super.key});

  @override
  State<BMIHome> createState() => _BMIHomeState();
}

class _BMIHomeState extends State<BMIHome> {
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
              onchanged: (newValue) {},
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
              onchanged: (newValue) {},
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
