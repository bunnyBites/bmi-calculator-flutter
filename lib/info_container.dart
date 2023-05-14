import 'package:flutter/material.dart';


class InfoContainer extends StatelessWidget {
  Color? cardColor;
  Widget? bodyContent;
  Function? onTap;

  InfoContainer({super.key,  userCardColor, userCardBody, onTapButton}) {
    bodyContent = userCardBody;
    cardColor = userCardColor;
    onTap = onTapButton;
  }

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