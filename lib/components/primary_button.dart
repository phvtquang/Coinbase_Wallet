import 'package:flutter/material.dart';

class primaryButton extends StatelessWidget {
  const primaryButton({
    Key? key,
    required this.insideText,
    required this.backgroundColor,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.textColor,
    required this.press,
  }) : super(key: key);

  final String insideText;
  final Color backgroundColor;
  final Color textColor;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // <-- Radius
          ),
        ),
        child: Text(
          insideText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
