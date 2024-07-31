import 'package:bmi_calculator/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BMIProvider extends ChangeNotifier {
  double _heightValue = 1.5;
  double _weightValue = 50.0;
  String _status = '';
  double _bmi = 0.0;
  Color _color = Colors.green;

  double get heightValue => _heightValue;

  double get weightValue => _weightValue;

  String get status => _status;

  double get bmi => _bmi;

  Color get color => _color;

  BMIProvider() {
    _updateBMI();
  }

  changeHeight(double value) {
    _heightValue = value;
    _updateBMI();
    notifyListeners();
  }

  changeWeight(double value) {
    _weightValue = value;
    _updateBMI();
    notifyListeners();
  }

  _updateBMI() {
    _bmi = weightValue / (_heightValue * _heightValue);
    _updateStatus();
    _updateColor();
  }

  _getStatus() {
    if (_bmi < 16) {
      return BMI.underweightSevere;
    }
    if (_bmi >= 16 && _bmi <= 16.9) {
      return BMI.underweightModerate;
    }
    if (_bmi >= 17 && _bmi <= 18.4) {
      return BMI.underweightMild;
    }
    if (_bmi >= 18.5 && _bmi <= 24.9) {
      return BMI.normal;
    }
    if (_bmi >= 25 && _bmi <= 29.9) {
      return BMI.overweightPre;
    }
    if (_bmi >= 30 && _bmi <= 34.9) {
      return BMI.obeseMild;
    }
    if (_bmi >= 35 && _bmi <= 39.9) {
      return BMI.obeseModerate;
    }
    if (_bmi >= 40) {
      return BMI.obeseSevere;
    }
  }

  _updateColor() {
    if (_bmi < 16) {
      _color = Colors.green.shade100;
    }
    if (_bmi >= 16 && bmi <= 16.9) {
      _color = Colors.green.shade200;
    }
    if (_bmi >= 17 && bmi <= 18.4) {
      _color = Colors.green.shade300;
    }
    if (_bmi >= 18.5 && bmi <= 24.9) {
      _color = Colors.green;
    }
    if (_bmi >= 25 && bmi <= 29.9) {
      _color = Colors.red.shade200;
    }
    if (_bmi >= 30 && bmi <= 34.9) {
      _color = Colors.red.shade400;
    }
    if (_bmi >= 35 && bmi <= 39.9) {
      _color = Colors.red.shade600;
    }
    if (_bmi >= 40) {
      _color = Colors.red.shade800;
    }
  }

  _updateStatus() {
    _status = _getStatus();
  }
}
