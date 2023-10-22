import 'package:flutter/material.dart';
import 'package:tuner_free/core/app_style.dart';

class CirclePitch extends StatelessWidget {
  const CirclePitch(
      {super.key,
      required this.note,
      required this.octave,
      required this.status});
  final String note;
  final int octave;
  final String status;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.fromLTRB(
        screenSize.width * 0.2,
        screenSize.height * 0.3,
        screenSize.width * 0.2,
        screenSize.height * 0.2,
      ),
      decoration: BoxDecoration(
        gradient: status == "tuned"
            ? RadialGradient(
                colors: [AppStyle().sucessColor, AppStyle().sucessColor2])
            : status == "waytoohigh" || status == "waytoolow"
                ? RadialGradient(
                    colors: [AppStyle().failureColor, AppStyle().failureColor2])
                : RadialGradient(
                    colors: [AppStyle().sucessColor, AppStyle().sucessColor2]),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              note,
              style: AppStyle().primary,
            ),
            Text(
              "$octave",
              style: AppStyle().secondary,
            ),
          ],
        ),
      ),
    );
  }
}
