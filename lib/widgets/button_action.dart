
import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({
    Key? key,
    this.color,
    required this.text,  this.onPressed,
  }) : super(key: key);

  final Color? color;
  final String text;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
       if(onPressed != null) {
          onPressed!();
        }
      },
      color: color ?? const Color.fromRGBO(255, 252, 243, 1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}