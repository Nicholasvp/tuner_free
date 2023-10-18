import 'package:bloc/bloc.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';

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

    flutterFft.onRecorderStateChanged.listen(
        (data) => {
              print("Changed state, received: $data"),
              emit(state.copyWith(
                frequency: data[1] as double,
                note: data[2] as String,
              )),
              flutterFft.setNote = state.note,
              flutterFft.setFrequency = state.frequency,
            },
        onError: (err) {
          print("Error: $err");
        },
        onDone: () => {print("Isdone")});
  }
}
