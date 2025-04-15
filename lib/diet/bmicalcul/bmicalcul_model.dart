import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'bmicalcul_widget.dart' show BmicalculWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BmicalculModel extends FlutterFlowModel<BmicalculWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for WeightTextField widget.
  FocusNode? weightTextFieldFocusNode;
  TextEditingController? weightTextFieldTextController;
  String? Function(BuildContext, String?)?
      weightTextFieldTextControllerValidator;
  // State field(s) for HeightTextField widget.
  FocusNode? heightTextFieldFocusNode;
  TextEditingController? heightTextFieldTextController;
  String? Function(BuildContext, String?)?
      heightTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (bmiCalc)] action in Button widget.
  ApiCallResponse? apiResultzqb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    weightTextFieldFocusNode?.dispose();
    weightTextFieldTextController?.dispose();

    heightTextFieldFocusNode?.dispose();
    heightTextFieldTextController?.dispose();
  }
}
