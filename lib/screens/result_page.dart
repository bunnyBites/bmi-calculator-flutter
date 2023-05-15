import 'package:bmi_calculator_flutter/components/footer_button.dart';
import 'package:bmi_calculator_flutter/components/info_container.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double result = 26.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: kResultHeaderTitleTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
            InfoContainer(
              cardColor: kActiveBoxBgColor,
              bodyContent: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "OVERWEIGHT",
                    textAlign: TextAlign.center,
                    style: kResultBMIFeedbackTextStyle,
                  ),
                  Text(result.toString(),
                      textAlign: TextAlign.center,
                      style: kLargeButtonTextStyle.copyWith(fontSize: 100.0)),
                  const Text(
                    "You have a higher than normal body weight. Try to exercise more.",
                    textAlign: TextAlign.center,
                    style: kResultBMIDescriptionTextStyle,
                  )
                ],
              ),
            ),
            FooterButton(
              label: "RE-CALCULATE",
              onPress: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
