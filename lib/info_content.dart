import 'package:flutter/material.dart';
import 'constants.dart';

class InfoContent extends StatelessWidget {
  IconData? icon;
  String gender = "";

  InfoContent({
    super.key,
    userIcon,
    userGender,
  }) {
    icon = userIcon;
    gender = userGender;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          gender,
          style: kLabelStyle,
        )
      ],
    );
  }
}
