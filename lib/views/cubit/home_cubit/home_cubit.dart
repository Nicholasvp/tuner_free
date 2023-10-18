import 'package:bloc/bloc.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:tuner_free/models/tuner_model.dart';

import 'package:tuner_free/views/cubit/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  final FlutterFft flutterFft = FlutterFft();

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
                octave: data[9] as int,
              )),
              flutterFft.setNote = state.note,
              flutterFft.setFrequency = state.frequency,
              flutterFft.setIsOnPitch = state.status,
            },
        onError: (err) {
          print("Error: $err");
        },
        onDone: () => {print("Isdone")});
  }

  String checkFrequency(double frequency) {
    for (double f in TunerModel.frequencies) {
      if (f >= frequency - 2 && f <= frequency + 2) {
        emit(state.copyWith(status: true));
        return state.status.toString();
      }
    }
    emit(state.copyWith(status: false));
    return state.status.toString();
  }
}
