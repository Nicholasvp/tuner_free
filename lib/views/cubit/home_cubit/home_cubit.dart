import 'package:bloc/bloc.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:pitchupdart/tuning_status.dart';

import 'package:tuner_free/views/cubit/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  final FlutterFft flutterFft = FlutterFft();
  final pitchUp = PitchHandler(InstrumentType.guitar);

  Future<void> initialize() async {
    print("Starting recorder...");

    while (!(await flutterFft.checkPermission())) {
      flutterFft.requestPermission();
    }

    await flutterFft.startRecorder();
    print("Recorder started...");
    emit(state.copyWith(isRecording: flutterFft.getIsRecording));
    var status;
    var note;

    flutterFft.onRecorderStateChanged.listen(
        (data) => {
              print("Changed state, received: $data"),
              status = checkFrequency(data[1] as double),
              note = checkNote(data[1] as double),
              print("status: $status"),
              emit(state.copyWith(
                  frequency: data[1] as double,
                  note: note,
                  octave: data[5] as int,
                  status: status)),
            },
        onError: (err) {
          print("Error: $err");
        },
        onDone: () => {print("Isdone")});
  }

  String checkFrequency(double frequency) {
    var handledPitchResult = pitchUp.handlePitch(frequency);
    return handledPitchResult.tuningStatus.name;
  }

  String checkNote(double frequency) {
    var handledPitchResult = pitchUp.handlePitch(frequency);
    return handledPitchResult.note;
  }
}
