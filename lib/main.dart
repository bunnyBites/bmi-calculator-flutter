import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/screens/input_page.dart';
import 'package:bmi_calculator_flutter/screens/result_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          elevation: 12,
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const InputPage(),
        "/result": (context) => const ResultPage(),
      },
    );
  }
}
