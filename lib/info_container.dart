import 'package:flutter/material.dart';


class InfoContainer extends StatelessWidget {
  final Color? cardColor;
  final Widget? bodyContent;
  final Function? onTap;

  const InfoContainer({super.key,  this.cardColor, this.bodyContent, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => { onTap!() },
        child: Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: bodyContent,
        ),
      ),
    );
  }
}