// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomeState {
  final double frequency;
  final String note;
  final int octave;
  final double distance;
  final String status;
  final bool isRecording;

  HomeState({
    required this.frequency,
    required this.note,
    required this.octave,
    required this.distance,
    required this.status,
    required this.isRecording,
  });

  factory HomeState.initial() => HomeState(
        frequency: 0,
        note: "A",
        distance: 0,
        status: "undefined",
        isRecording: false,
        octave: 1,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frequency': frequency,
      'note': note,
      'octave': octave,
      'distance': distance,
      'status': status,
      'isRecording': isRecording,
    };
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      frequency: map['frequency'] as double,
      note: map['note'] as String,
      octave: map['octave'] as int,
      distance: map['distance'] as double,
      status: map['status'] as String,
      isRecording: map['isRecording'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeState.fromJson(String source) =>
      HomeState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeState(frequency: $frequency, note: $note, octave: $octave, distance: $distance, status: $status, isRecording: $isRecording)';
  }

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.frequency == frequency &&
        other.note == note &&
        other.octave == octave &&
        other.distance == distance &&
        other.status == status &&
        other.isRecording == isRecording;
  }

  @override
  int get hashCode {
    return frequency.hashCode ^
        note.hashCode ^
        octave.hashCode ^
        distance.hashCode ^
        status.hashCode ^
        isRecording.hashCode;
  }

  HomeState copyWith({
    double? frequency,
    String? note,
    int? octave,
    double? distance,
    String? status,
    bool? isRecording,
  }) {
    return HomeState(
      frequency: frequency ?? this.frequency,
      note: note ?? this.note,
      octave: octave ?? this.octave,
      distance: distance ?? this.distance,
      status: status ?? this.status,
      isRecording: isRecording ?? this.isRecording,
    );
  }
}
