// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonGeneral extends StatelessWidget {
  final VoidCallback onPress;
  final Color backgroundColor;
  final Widget widgetChild;
  final Color textColor;

  const ButtonGeneral({
    Key? key,
    required this.onPress,
    required this.backgroundColor,
    required this.widgetChild,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: TextButton(
          onPressed: onPress,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: widgetChild,
          ),
        ),
      ),
    );
  }
}
