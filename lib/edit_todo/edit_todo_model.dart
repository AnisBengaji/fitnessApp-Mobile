import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_todo_widget.dart' show EditTodoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTodoModel extends FlutterFlowModel<EditTodoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  List<TodoRecord>? editTodoPreviousSnapshot;
  // State field(s) for titre widget.
  FocusNode? titreFocusNode;
  TextEditingController? titreTextController;
  String? Function(BuildContext, String?)? titreTextControllerValidator;
  String? _titreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fill this out';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // State field(s) for Desceription widget.
  FocusNode? desceriptionFocusNode;
  TextEditingController? desceriptionTextController;
  String? Function(BuildContext, String?)? desceriptionTextControllerValidator;
  String? _desceriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fill this out';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    titreTextControllerValidator = _titreTextControllerValidator;
    desceriptionTextControllerValidator = _desceriptionTextControllerValidator;
  }

  @override
  void dispose() {
    titreFocusNode?.dispose();
    titreTextController?.dispose();

    desceriptionFocusNode?.dispose();
    desceriptionTextController?.dispose();
  }
}
