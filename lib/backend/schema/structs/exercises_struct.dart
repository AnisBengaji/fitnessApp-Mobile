// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExercisesStruct extends FFFirebaseStruct {
  ExercisesStruct({
    DocumentReference? exerciseRef,
    List<SetStruct>? sets,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exerciseRef = exerciseRef,
        _sets = sets,
        super(firestoreUtilData);

  // "exerciseRef" field.
  DocumentReference? _exerciseRef;
  DocumentReference? get exerciseRef => _exerciseRef;
  set exerciseRef(DocumentReference? val) => _exerciseRef = val;

  bool hasExerciseRef() => _exerciseRef != null;

  // "sets" field.
  List<SetStruct>? _sets;
  List<SetStruct> get sets => _sets ?? const [];
  set sets(List<SetStruct>? val) => _sets = val;

  void updateSets(Function(List<SetStruct>) updateFn) {
    updateFn(_sets ??= []);
  }

  bool hasSets() => _sets != null;

  static ExercisesStruct fromMap(Map<String, dynamic> data) => ExercisesStruct(
        exerciseRef: data['exerciseRef'] as DocumentReference?,
        sets: getStructList(
          data['sets'],
          SetStruct.fromMap,
        ),
      );

  static ExercisesStruct? maybeFromMap(dynamic data) => data is Map
      ? ExercisesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'exerciseRef': _exerciseRef,
        'sets': _sets?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseRef': serializeParam(
          _exerciseRef,
          ParamType.DocumentReference,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ExercisesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExercisesStruct(
        exerciseRef: deserializeParam(
          data['exerciseRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['exercises'],
        ),
        sets: deserializeStructParam<SetStruct>(
          data['sets'],
          ParamType.DataStruct,
          true,
          structBuilder: SetStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ExercisesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ExercisesStruct &&
        exerciseRef == other.exerciseRef &&
        listEquality.equals(sets, other.sets);
  }

  @override
  int get hashCode => const ListEquality().hash([exerciseRef, sets]);
}

ExercisesStruct createExercisesStruct({
  DocumentReference? exerciseRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExercisesStruct(
      exerciseRef: exerciseRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExercisesStruct? updateExercisesStruct(
  ExercisesStruct? exercises, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    exercises
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExercisesStructData(
  Map<String, dynamic> firestoreData,
  ExercisesStruct? exercises,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (exercises == null) {
    return;
  }
  if (exercises.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && exercises.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final exercisesData = getExercisesFirestoreData(exercises, forFieldValue);
  final nestedData = exercisesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = exercises.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExercisesFirestoreData(
  ExercisesStruct? exercises, [
  bool forFieldValue = false,
]) {
  if (exercises == null) {
    return {};
  }
  final firestoreData = mapToFirestore(exercises.toMap());

  // Add any Firestore field values
  exercises.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExercisesListFirestoreData(
  List<ExercisesStruct>? exercisess,
) =>
    exercisess?.map((e) => getExercisesFirestoreData(e, true)).toList() ?? [];
