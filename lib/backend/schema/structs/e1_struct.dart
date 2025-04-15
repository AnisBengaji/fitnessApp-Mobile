// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class E1Struct extends FFFirebaseStruct {
  E1Struct({
    String? name,
    String? type,
    String? muscle,
    String? equipment,
    String? difficulty,
    String? instructions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _type = type,
        _muscle = muscle,
        _equipment = equipment,
        _difficulty = difficulty,
        _instructions = instructions,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "muscle" field.
  String? _muscle;
  String get muscle => _muscle ?? '';
  set muscle(String? val) => _muscle = val;

  bool hasMuscle() => _muscle != null;

  // "equipment" field.
  String? _equipment;
  String get equipment => _equipment ?? '';
  set equipment(String? val) => _equipment = val;

  bool hasEquipment() => _equipment != null;

  // "difficulty" field.
  String? _difficulty;
  String get difficulty => _difficulty ?? '';
  set difficulty(String? val) => _difficulty = val;

  bool hasDifficulty() => _difficulty != null;

  // "instructions" field.
  String? _instructions;
  String get instructions => _instructions ?? '';
  set instructions(String? val) => _instructions = val;

  bool hasInstructions() => _instructions != null;

  static E1Struct fromMap(Map<String, dynamic> data) => E1Struct(
        name: data['name'] as String?,
        type: data['type'] as String?,
        muscle: data['muscle'] as String?,
        equipment: data['equipment'] as String?,
        difficulty: data['difficulty'] as String?,
        instructions: data['instructions'] as String?,
      );

  static E1Struct? maybeFromMap(dynamic data) =>
      data is Map ? E1Struct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'type': _type,
        'muscle': _muscle,
        'equipment': _equipment,
        'difficulty': _difficulty,
        'instructions': _instructions,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'muscle': serializeParam(
          _muscle,
          ParamType.String,
        ),
        'equipment': serializeParam(
          _equipment,
          ParamType.String,
        ),
        'difficulty': serializeParam(
          _difficulty,
          ParamType.String,
        ),
        'instructions': serializeParam(
          _instructions,
          ParamType.String,
        ),
      }.withoutNulls;

  static E1Struct fromSerializableMap(Map<String, dynamic> data) => E1Struct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        muscle: deserializeParam(
          data['muscle'],
          ParamType.String,
          false,
        ),
        equipment: deserializeParam(
          data['equipment'],
          ParamType.String,
          false,
        ),
        difficulty: deserializeParam(
          data['difficulty'],
          ParamType.String,
          false,
        ),
        instructions: deserializeParam(
          data['instructions'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'E1Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is E1Struct &&
        name == other.name &&
        type == other.type &&
        muscle == other.muscle &&
        equipment == other.equipment &&
        difficulty == other.difficulty &&
        instructions == other.instructions;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, type, muscle, equipment, difficulty, instructions]);
}

E1Struct createE1Struct({
  String? name,
  String? type,
  String? muscle,
  String? equipment,
  String? difficulty,
  String? instructions,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    E1Struct(
      name: name,
      type: type,
      muscle: muscle,
      equipment: equipment,
      difficulty: difficulty,
      instructions: instructions,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

E1Struct? updateE1Struct(
  E1Struct? e1, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    e1
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addE1StructData(
  Map<String, dynamic> firestoreData,
  E1Struct? e1,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (e1 == null) {
    return;
  }
  if (e1.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && e1.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final e1Data = getE1FirestoreData(e1, forFieldValue);
  final nestedData = e1Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = e1.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getE1FirestoreData(
  E1Struct? e1, [
  bool forFieldValue = false,
]) {
  if (e1 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(e1.toMap());

  // Add any Firestore field values
  e1.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getE1ListFirestoreData(
  List<E1Struct>? e1s,
) =>
    e1s?.map((e) => getE1FirestoreData(e, true)).toList() ?? [];
