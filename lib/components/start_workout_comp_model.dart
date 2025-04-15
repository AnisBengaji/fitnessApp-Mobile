import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/exercise_compone_widget.dart';
import '/components/input_reps_widget.dart';
import '/components/input_weight_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'start_workout_comp_widget.dart' show StartWorkoutCompWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartWorkoutCompModel extends FlutterFlowModel<StartWorkoutCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputWorkouname widget.
  FocusNode? inputWorkounameFocusNode;
  TextEditingController? inputWorkounameTextController;
  String? Function(BuildContext, String?)?
      inputWorkounameTextControllerValidator;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Models for inputWeight dynamic component.
  late FlutterFlowDynamicModels<InputWeightModel> inputWeightModels;
  // Models for inputReps dynamic component.
  late FlutterFlowDynamicModels<InputRepsModel> inputRepsModels;

  @override
  void initState(BuildContext context) {
    inputWeightModels = FlutterFlowDynamicModels(() => InputWeightModel());
    inputRepsModels = FlutterFlowDynamicModels(() => InputRepsModel());
  }

  @override
  void dispose() {
    inputWorkounameFocusNode?.dispose();
    inputWorkounameTextController?.dispose();

    timerController.dispose();
    inputWeightModels.dispose();
    inputRepsModels.dispose();
  }
}
