import 'package:flutter/material.dart';


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
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8E8D98),
          ),
        )
      ],
    );
  }
}