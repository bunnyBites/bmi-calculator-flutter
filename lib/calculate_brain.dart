import 'dart:math';

class CalculateBrain {
  final int height;
  final int weight;
  double _calculatedBMI = 0;

  CalculateBrain({ required this.height, required this.weight }) {
    _calculatedBMI = (weight / pow(height/100, 2));
  }


  String getCalculatedBMI() {
    return _calculatedBMI.toStringAsFixed(1);
  }


  String getBMIFeedback() {
    if (_calculatedBMI >= 25) {
      return "Overweight";
    } else if (_calculatedBMI > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getBMIDescription() {
    if (_calculatedBMI >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_calculatedBMI > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}