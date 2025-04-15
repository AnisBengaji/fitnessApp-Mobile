import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'calculator_widget.dart' show CalculatorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalculatorModel extends FlutterFlowModel<CalculatorWidget> {
  ///  Local state fields for this page.

  double bmr = 0.0;

  double dailycalories = 0.0;

  double weight = 0.0;

  double height = 0.0;

  int age = 0;

  String gender = '\"\"';

  String activityLevel = '\"\"';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ageTextField widget.
  FocusNode? ageTextFieldFocusNode;
  TextEditingController? ageTextFieldTextController;
  String? Function(BuildContext, String?)? ageTextFieldTextControllerValidator;
  String? _ageTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'age is required';
    }

    if (val.length > 2) {
      return 'Maximum 2 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for genderDropdown widget.
  String? genderDropdownValue;
  FormFieldController<String>? genderDropdownValueController;
  // State field(s) for weightTextField widget.
  FocusNode? weightTextFieldFocusNode;
  TextEditingController? weightTextFieldTextController;
  String? Function(BuildContext, String?)?
      weightTextFieldTextControllerValidator;
  String? _weightTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Weight (kg) is required';
    }

    return null;
  }

  // State field(s) for heightTextField widget.
  FocusNode? heightTextFieldFocusNode;
  TextEditingController? heightTextFieldTextController;
  String? Function(BuildContext, String?)?
      heightTextFieldTextControllerValidator;
  String? _heightTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Height (cm) is required';
    }

    return null;
  }

  // State field(s) for activityDropdown widget.
  String? activityDropdownValue;
  FormFieldController<String>? activityDropdownValueController;

  @override
  void initState(BuildContext context) {
    ageTextFieldTextControllerValidator = _ageTextFieldTextControllerValidator;
    weightTextFieldTextControllerValidator =
        _weightTextFieldTextControllerValidator;
    heightTextFieldTextControllerValidator =
        _heightTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    ageTextFieldFocusNode?.dispose();
    ageTextFieldTextController?.dispose();

    weightTextFieldFocusNode?.dispose();
    weightTextFieldTextController?.dispose();

    heightTextFieldFocusNode?.dispose();
    heightTextFieldTextController?.dispose();
  }
}
