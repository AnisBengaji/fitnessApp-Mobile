// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutStruct extends FFFirebaseStruct {
  WorkoutStruct({
    String? name,
    List<ExercisesStruct>? exercise,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _exercise = exercise,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "exercise" field.
  List<ExercisesStruct>? _exercise;
  List<ExercisesStruct> get exercise => _exercise ?? const [];
  set exercise(List<ExercisesStruct>? val) => _exercise = val;

  void updateExercise(Function(List<ExercisesStruct>) updateFn) {
    updateFn(_exercise ??= []);
  }

  bool hasExercise() => _exercise != null;

  static WorkoutStruct fromMap(Map<String, dynamic> data) => WorkoutStruct(
        name: data['name'] as String?,
        exercise: getStructList(
          data['exercise'],
          ExercisesStruct.fromMap,
        ),
      );

  static WorkoutStruct? maybeFromMap(dynamic data) =>
      data is Map ? WorkoutStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'exercise': _exercise?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'exercise': serializeParam(
          _exercise,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static WorkoutStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkoutStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        exercise: deserializeStructParam<ExercisesStruct>(
          data['exercise'],
          ParamType.DataStruct,
          true,
          structBuilder: ExercisesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WorkoutStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkoutStruct &&
        name == other.name &&
        listEquality.equals(exercise, other.exercise);
  }

  @override
  int get hashCode => const ListEquality().hash([name, exercise]);
}

WorkoutStruct createWorkoutStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkoutStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkoutStruct? updateWorkoutStruct(
  WorkoutStruct? workout, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workout
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkoutStructData(
  Map<String, dynamic> firestoreData,
  WorkoutStruct? workout,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workout == null) {
    return;
  }
  if (workout.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workout.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workoutData = getWorkoutFirestoreData(workout, forFieldValue);
  final nestedData = workoutData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workout.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkoutFirestoreData(
  WorkoutStruct? workout, [
  bool forFieldValue = false,
]) {
  if (workout == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workout.toMap());

  // Add any Firestore field values
  workout.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkoutListFirestoreData(
  List<WorkoutStruct>? workouts,
) =>
    workouts?.map((e) => getWorkoutFirestoreData(e, true)).toList() ?? [];
