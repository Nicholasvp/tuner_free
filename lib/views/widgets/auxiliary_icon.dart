import 'package:flutter/material.dart';
import 'package:pitchupdart/tuning_status.dart';
import 'package:tuner_free/core/app_style.dart';

class AuxiliaryIcon extends StatelessWidget {
  const AuxiliaryIcon({super.key, required this.status});
  final TuningStatus status;

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
        status == TuningStatus.tuned
            ? Icons.done
            : status == TuningStatus.toohigh
                ? Icons.arrow_circle_down_rounded
                : Icons.arrow_circle_up_rounded,
        size: 50,
        color: AppStyle().sucessColor,
      ),
    );
  }
}
