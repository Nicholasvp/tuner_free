import 'package:flutter/material.dart';

class AppStyle {
  TextStyle primary = const TextStyle(fontSize: 80, color: Colors.white);
  TextStyle secondary = const TextStyle(fontSize: 30, color: Colors.white);

  Color failureColor = const Color(0xFFE31B00);
  Color failureColor2 = const Color(0xFFBF1700);

  Color primaryBackground = const Color(0xFF1E1E1E);
  Color sucessColor = const Color(0xFF038B01);
  Color sucessColor2 = const Color(0xFF027A00);

  Icon tuned = const Icon(
    Icons.done,
    color: Color(0xFF038B01),
    size: 80,
  );

  Icon waytoohigh = const Icon(
    Icons.arrow_circle_down_rounded,
    color: Color(0xFFE31B00),
    size: 80,
  );

  Icon waytoolow = const Icon(
    Icons.arrow_circle_up_rounded,
    color: Color(0xFFE31B00),
    size: 80,
  );
}
