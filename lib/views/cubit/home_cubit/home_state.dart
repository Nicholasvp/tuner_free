// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeState {
  final double frequency;
  final String note;
  final bool isRecording;

  HomeState(this.frequency, this.note, this.isRecording);

  factory HomeState.initial() => HomeState(0, "A", false);

  HomeState copyWith({
    double? frequency,
    String? note,
    bool? isRecording,
  }) {
    return HomeState(
      frequency ?? this.frequency,
      note ?? this.note,
      isRecording ?? this.isRecording,
    );
  }
}
