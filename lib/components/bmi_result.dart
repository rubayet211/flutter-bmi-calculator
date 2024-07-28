import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final Color color;
  final double bmi;
  final String status;
  const BMIResult({
    super.key,
    required this.color,
    required this.bmi,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(
            microseconds: 500,
          ),
          alignment: Alignment.center,
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 10,
            ),
            shape: BoxShape.circle,
          ),
          child: Text(
            bmi.toStringAsFixed(1),
            style: textValueStyle.copyWith(
              fontSize: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            status,
            style: textResultStyle,
          ),
        )
      ],
    );
  }
}
