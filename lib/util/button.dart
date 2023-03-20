import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final Icon? iconText;
  final Color buttonColor;
  final Color textColor;
  const Button({
    super.key,
    required this.buttonName,
    this.iconText,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      height: deviceHeight * 0.09,
      width: deviceWidth * 0.4,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

            child: iconText,
          ),
          Text(
            buttonName,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
