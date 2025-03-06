import 'package:flutter/material.dart';

import '../data/style.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  const AppButton({super.key, this.text, this.onPressed, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shadowColor: Colors.transparent, // Removes any shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Ink(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFAFC8E4),
              Color(0xFF84AED9),
              Color(0xFF004285),
            ],
            stops: [0.1, 0.3, 1.0], // Optional to control gradient stops
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text??"",
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
