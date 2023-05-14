import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData? icon;
  final Function? onPress;

  const ActionButton({super.key, this.icon, this.onPress });

  @override
  Widget build(BuildContext context) {
    return (
      RawMaterialButton(
        onPressed: () { onPress!(); },
        fillColor: const Color(0xFF4C4F5E),
        constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
        shape: const CircleBorder(),
        child: Icon(icon),
      )
    );
  }
}