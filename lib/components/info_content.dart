import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class InfoContent extends StatelessWidget {
  final IconData? icon;
  final String? gender;

  const InfoContent({
    super.key,
    this.icon,
    this.gender,
  });

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
          gender!,
          style: kLabelStyle,
        )
      ],
    );
  }
}
