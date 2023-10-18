// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pitchupdart/tuning_status.dart';

class HomeState {
  final double frequency;
  final String note;
  final bool isRecording;
  final TuningStatus status;
  HomeState({
    required this.frequency,
    required this.note,
    required this.isRecording,
    required this.status,
  });

  factory HomeState.initial() => HomeState(
      frequency: 0,
      note: "A",
      isRecording: false,
      status: TuningStatus.undefined);

  HomeState copyWith({
    double? frequency,
    String? note,
    bool? isRecording,
    TuningStatus? status,
  }) {
    return HomeState(
      frequency: frequency ?? this.frequency,
      note: note ?? this.note,
      isRecording: isRecording ?? this.isRecording,
      status: status ?? this.status,
    );
  }
}
