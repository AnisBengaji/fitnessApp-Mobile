import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'weather_widget.dart' show WeatherWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeatherModel extends FlutterFlowModel<WeatherWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // Stores action output result for [Backend Call - API (Get weather)] action in Button widget.
  ApiCallResponse? currentMeteo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cityFocusNode?.dispose();
    cityTextController?.dispose();
  }
}
