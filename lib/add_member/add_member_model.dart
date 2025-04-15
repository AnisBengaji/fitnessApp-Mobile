import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'add_member_widget.dart' show AddMemberWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMemberModel extends FlutterFlowModel<AddMemberWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> choosenPeople = [];
  void addToChoosenPeople(DocumentReference item) => choosenPeople.add(item);
  void removeFromChoosenPeople(DocumentReference item) =>
      choosenPeople.remove(item);
  void removeAtIndexFromChoosenPeople(int index) =>
      choosenPeople.removeAt(index);
  void insertAtIndexInChoosenPeople(int index, DocumentReference item) =>
      choosenPeople.insert(index, item);
  void updateChoosenPeopleAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      choosenPeople[index] = updateFn(choosenPeople[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxListTile widget.
  Map<UsersRecord, bool> checkboxListTileValueMap = {};
  List<UsersRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
