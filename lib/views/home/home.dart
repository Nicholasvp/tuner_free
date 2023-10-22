import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuner_free/core/app_style.dart';
import 'package:tuner_free/views/cubit/home_cubit/home_cubit.dart';
import 'package:tuner_free/views/cubit/home_cubit/home_state.dart';

import 'package:tuner_free/views/widgets/auxiliary_icon.dart';

import 'package:tuner_free/views/widgets/circle_pitch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppStyle().primaryBackground,
        body: CirclePitch(
          note: state.note.isEmpty ? "A" : state.note,
          octave: state.octave,
          status: state.status,
        ),
        bottomNavigationBar: AuxiliaryIcon(status: state.status),
      );
    });
  }
}
