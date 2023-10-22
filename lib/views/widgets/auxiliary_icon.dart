import 'package:flutter/material.dart';

import 'package:tuner_free/core/app_style.dart';

class AuxiliaryIcon extends StatelessWidget {
  final String status;

  const AuxiliaryIcon({super.key, required this.status});

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
        child: status == "tuned"
            ? AppStyle().tuned
            : status == "waytoolow"
                ? AppStyle().waytoolow
                : status == "waytoohigh"
                    ? AppStyle().waytoohigh
                    : AppStyle().tuned);
  }
}
