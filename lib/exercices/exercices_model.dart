import '/components/exercise_compone_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'exercices_widget.dart' show ExercicesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExercicesModel extends FlutterFlowModel<ExercicesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for exerciseCompone component.
  late ExerciseComponeModel exerciseComponeModel;

  @override
  void initState(BuildContext context) {
    exerciseComponeModel = createModel(context, () => ExerciseComponeModel());
  }

  @override
  void dispose() {
    exerciseComponeModel.dispose();
  }
}
