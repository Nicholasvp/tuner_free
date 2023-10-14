import 'package:flutter/material.dart';
import 'package:tuner_free/core/app_style.dart';

class AuxiliaryIcon extends StatelessWidget {
  const AuxiliaryIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.fromLTRB(
        screenSize.width * 0.2,
        0,
        screenSize.width * 0.2,
        screenSize.height * 0.1,
      ),
      child: Icon(
        Icons.done,
        size: 50,
        color: AppStyle().sucessColor,
      ),
    );
  }
}
