import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  DefaultTextButton({
    this.onPressed,
    this.textButtonColor,
    required this.textButtonTitle,
    super.key,
  });
  Color? textButtonColor;
  String textButtonTitle;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textButtonTitle,
        style: TextStyle(fontWeight: FontWeight.w600, 
        color: textButtonColor =Color.fromRGBO(1, 52, 169, 1)),
      ),
    );
  }
}
