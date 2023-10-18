class HomeState {
  final double frequency;
  final String note;
  final int octave;
  final bool status;
  final bool isRecording;

  HomeState({
    required this.frequency,
    required this.note,
    required this.octave,
    required this.status,
    required this.isRecording,
  });

  factory HomeState.initial() => HomeState(
        frequency: 0,
        note: "A",
        status: false,
        isRecording: false,
        octave: 1,
      );

  HomeState copyWith({
    double? frequency,
    String? note,
    int? octave,
    bool? status,
    bool? isRecording,
  }) {
    return HomeState(
      frequency: frequency ?? this.frequency,
      note: note ?? this.note,
      octave: octave ?? this.octave,
      status: status ?? this.status,
      isRecording: isRecording ?? this.isRecording,
    );
  }
}
