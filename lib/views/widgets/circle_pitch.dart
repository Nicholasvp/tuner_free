import 'package:flutter/material.dart';
import 'package:tuner_free/core/app_style.dart';

class CirclePitch extends StatelessWidget {
  const CirclePitch({super.key, required this.note});
  final String note;

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
        color: AppStyle().primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          note,
          style: AppStyle().primary,
        ),
      ),
    );
  }
}
