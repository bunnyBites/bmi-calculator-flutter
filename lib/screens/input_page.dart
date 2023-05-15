import 'package:bmi_calculator_flutter/calculate_brain.dart';
import 'package:bmi_calculator_flutter/components/action_button.dart';
import 'package:bmi_calculator_flutter/components/footer_button.dart';
import 'package:bmi_calculator_flutter/components/info_container.dart';
import 'package:bmi_calculator_flutter/components/info_content.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 150;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: (Column(
          children: [
            genderSelector(),
            heightSlider(),
            bodyParamsSelector(),

            // calculate button
            FooterButton(
                label: "CALCULATE",
                onPress: () {
                  CalculateBrain calculateBrain =
                      CalculateBrain(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiFeedbackDescription:
                            calculateBrain.getBMIDescription(),
                        bmiFeedbackTitle: calculateBrain.getBMIFeedback(),
                        calculatedBMI: calculateBrain.getCalculatedBMI(),
                      ),
                    ),
                  );
                }),
          ],
        )),
      ),
    );
  }

  InfoContainer heightSlider() => InfoContainer(
        cardColor: kActiveBoxBgColor,
        bodyContent: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Height",
              style: kLabelStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: kContentValueStyle,
                ),
                const Text("cm")
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: kSliderInActiveColor,
                thumbColor: kSliderActiveColor,
                trackHeight: 1.5,
                overlayColor: const Color(0x32EB1555),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 40.0),
              ),
              child: Slider(
                value: height.toDouble(),
                onChanged: (double selectedHeight) {
                  setState(() {
                    height = selectedHeight.round();
                  });
                },
                min: kSliderMinValue,
                max: kSliderMaxValue,
              ),
            )
          ],
        ),
      );

  Expanded bodyParamsSelector() {
    return Expanded(
      child: Row(
        children: [
          InfoContainer(
            cardColor: kActiveBoxBgColor,
            bodyContent:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Weight", style: kLabelStyle),
              Text(weight.toString(), style: kContentValueStyle),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                      icon: FontAwesomeIcons.minus,
                      onPress: () {
                        setState(() {
                          weight--;
                        });
                      }),
                  const SizedBox(
                    width: 12.0,
                  ),
                  ActionButton(
                    icon: FontAwesomeIcons.plus,
                    onPress: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ],
              )
            ]),
          ),
          InfoContainer(
              cardColor: kActiveBoxBgColor,
              bodyContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Age",
                    style: kLabelStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kContentValueStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(
                        icon: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      const SizedBox(width: 12.0),
                      ActionButton(
                        icon: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Expanded genderSelector() {
    return Expanded(
      child: Row(
        children: [
          InfoContainer(
            onTap: () {
              setState(() {
                selectedGender = Gender.male;
              });
            },
            cardColor: (selectedGender == Gender.male
                ? kActiveBoxBgColor
                : kInActiveBoxBgColor),
            bodyContent:
                const InfoContent(icon: FontAwesomeIcons.mars, gender: "MALE"),
          ),
          InfoContainer(
            onTap: () {
              setState(() {
                selectedGender = Gender.female;
              });
            },
            cardColor: (selectedGender == Gender.female
                ? kActiveBoxBgColor
                : kInActiveBoxBgColor),
            bodyContent: const InfoContent(
              icon: FontAwesomeIcons.venus,
              gender: "FEMALE",
            ),
          ),
        ],
      ),
    );
  }
}
