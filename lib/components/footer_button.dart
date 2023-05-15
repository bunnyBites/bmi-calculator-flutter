import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  final Function? onPress;
  final String? label;

  const FooterButton({
    super.key,
    this.label,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        color: Colors.pink,
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        child: Center(
            child: Text(
          label!,
          style: kLargeButtonTextStyle,
        )),
      ),
    );
  }
}
