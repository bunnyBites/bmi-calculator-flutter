import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'action_button.dart';
import 'constants.dart';
import 'info_container.dart';
import 'info_content.dart';

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
  int height = 120;
  int weight = 50;
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
            Container(
              height: 80.0,
              color: Colors.pink,
              margin: const EdgeInsets.only(top: 12.0),
              width: double.infinity,
              child: const Center(
                  child: Text(
                "Calculate",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              )),
            ),
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
