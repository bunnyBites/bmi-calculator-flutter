import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'info_container.dart';
import 'info_content.dart';

const Color activeBoxBgColor = Color(0xFF1D1E33);
const Color inactiveBoxBgColor = Color(0xFF111328);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: (Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  InfoContainer(
                    onTapButton: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    userCardColor: (selectedGender == Gender.male
                        ? activeBoxBgColor
                        : inactiveBoxBgColor),
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
                        ? activeBoxBgColor
                        : inactiveBoxBgColor),
                    userCardBody: InfoContent(
                      userIcon: FontAwesomeIcons.venus,
                      userGender: "FEMALE",
                    ),
                  ),
                ],
              ),
            ),
            InfoContainer(userCardColor: activeBoxBgColor),
            Expanded(
              child: Row(
                children: [
                  InfoContainer(userCardColor: activeBoxBgColor),
                  InfoContainer(userCardColor: activeBoxBgColor),
                ],
              ),
            ),
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
}
