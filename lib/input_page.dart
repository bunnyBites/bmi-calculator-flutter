import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        userCardColor: kActiveBoxBgColor,
        userCardBody: Column(
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
            Slider(
              value: height.toDouble(),
              onChanged: (double selectedHeight) {
                setState(() {
                  height = selectedHeight.round();
                });
              },
              min: kSliderMinValue,
              max: kSliderMaxValue,
              activeColor: kSliderActiveColor,
              inactiveColor: kSliderInActiveColor,
            )
          ],
        ),
      );

  Expanded bodyParamsSelector() {
    return Expanded(
      child: Row(
        children: [
          InfoContainer(userCardColor: kActiveBoxBgColor),
          InfoContainer(userCardColor: kActiveBoxBgColor),
        ],
      ),
    );
  }

  Expanded genderSelector() {
    return Expanded(
      child: Row(
        children: [
          InfoContainer(
            onTapButton: () {
              setState(() {
                selectedGender = Gender.male;
              });
            },
            userCardColor: (selectedGender == Gender.male
                ? kActiveBoxBgColor
                : kInActiveBoxBgColor),
            userCardBody: InfoContent(
                userIcon: FontAwesomeIcons.mars, userGender: "MALE"),
          ),
          InfoContainer(
            onTapButton: () {
              setState(() {
                selectedGender = Gender.female;
              });
            },
            userCardColor: (selectedGender == Gender.female
                ? kActiveBoxBgColor
                : kInActiveBoxBgColor),
            userCardBody: InfoContent(
              userIcon: FontAwesomeIcons.venus,
              userGender: "FEMALE",
            ),
          ),
        ],
      ),
    );
  }
}
