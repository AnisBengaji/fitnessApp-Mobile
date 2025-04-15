// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendrierStruct extends FFFirebaseStruct {
  CalendrierStruct({
    String? naeRendezVous,
    String? descrp,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _naeRendezVous = naeRendezVous,
        _descrp = descrp,
        _date = date,
        super(firestoreUtilData);

  // "NaeRendezVous" field.
  String? _naeRendezVous;
  String get naeRendezVous => _naeRendezVous ?? '';
  set naeRendezVous(String? val) => _naeRendezVous = val;

  bool hasNaeRendezVous() => _naeRendezVous != null;

  // "Descrp" field.
  String? _descrp;
  String get descrp => _descrp ?? '';
  set descrp(String? val) => _descrp = val;

  bool hasDescrp() => _descrp != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static CalendrierStruct fromMap(Map<String, dynamic> data) =>
      CalendrierStruct(
        naeRendezVous: data['NaeRendezVous'] as String?,
        descrp: data['Descrp'] as String?,
        date: data['date'] as DateTime?,
      );

  static CalendrierStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendrierStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'NaeRendezVous': _naeRendezVous,
        'Descrp': _descrp,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NaeRendezVous': serializeParam(
          _naeRendezVous,
          ParamType.String,
        ),
        'Descrp': serializeParam(
          _descrp,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CalendrierStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendrierStruct(
        naeRendezVous: deserializeParam(
          data['NaeRendezVous'],
          ParamType.String,
          false,
        ),
        descrp: deserializeParam(
          data['Descrp'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CalendrierStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalendrierStruct &&
        naeRendezVous == other.naeRendezVous &&
        descrp == other.descrp &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([naeRendezVous, descrp, date]);
}

CalendrierStruct createCalendrierStruct({
  String? naeRendezVous,
  String? descrp,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalendrierStruct(
      naeRendezVous: naeRendezVous,
      descrp: descrp,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CalendrierStruct? updateCalendrierStruct(
  CalendrierStruct? calendrier, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    calendrier
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCalendrierStructData(
  Map<String, dynamic> firestoreData,
  CalendrierStruct? calendrier,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (calendrier == null) {
    return;
  }
  if (calendrier.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && calendrier.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final calendrierData = getCalendrierFirestoreData(calendrier, forFieldValue);
  final nestedData = calendrierData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = calendrier.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCalendrierFirestoreData(
  CalendrierStruct? calendrier, [
  bool forFieldValue = false,
]) {
  if (calendrier == null) {
    return {};
  }
  final firestoreData = mapToFirestore(calendrier.toMap());

  // Add any Firestore field values
  calendrier.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCalendrierListFirestoreData(
  List<CalendrierStruct>? calendriers,
) =>
    calendriers?.map((e) => getCalendrierFirestoreData(e, true)).toList() ?? [];
