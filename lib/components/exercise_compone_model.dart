import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'exercise_compone_widget.dart' show ExerciseComponeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExerciseComponeModel extends FlutterFlowModel<ExerciseComponeWidget> {
  ///  Local state fields for this component.

  int total = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.
  Map<ExercisesRecord, bool> checkboxListTileValueMap = {};
  List<ExercisesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
