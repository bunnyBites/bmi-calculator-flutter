import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final Color cardColor;

  const InfoContainer(this.cardColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    );
  }
}