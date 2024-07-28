import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMISlider extends StatelessWidget {
  final String label;
  final BMIUnit unit;
  final double sliderValue;
  final int sliderDivision;
  final double sliderMax, sliderMin;
  final Function(double) onchanged;
  const BMISlider({
    super.key,
    required this.label,
    required this.unit,
    required this.sliderValue,
    required this.sliderDivision,
    required this.sliderMax,
    required this.sliderMin,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: textLabelStyle,
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
              ),
              child: RichText(
                text: TextSpan(
                  text: sliderValue.toStringAsFixed(1),
                  style: textValueStyle,
                  children: [
                    TextSpan(
                      text: ' ${unit.name}',
                      style: textLabelStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Slider(
          max: sliderMax,
          min: sliderMin,
          activeColor: Colors.white70,
          inactiveColor: Colors.white30,
          label: sliderValue.toStringAsFixed(1),
          value: sliderValue,
          onChanged: (value) {
            onchanged(value);
          },
        )
      ],
    );
  }
}
