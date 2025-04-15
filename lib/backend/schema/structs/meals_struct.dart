// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealsStruct extends FFFirebaseStruct {
  MealsStruct({
    String? title,
    int? readyInMinutes,
    int? servings,
    String? sourceUrl,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _readyInMinutes = readyInMinutes,
        _servings = servings,
        _sourceUrl = sourceUrl,
        _image = image,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "readyInMinutes" field.
  int? _readyInMinutes;
  int get readyInMinutes => _readyInMinutes ?? 0;
  set readyInMinutes(int? val) => _readyInMinutes = val;

  void incrementReadyInMinutes(int amount) =>
      readyInMinutes = readyInMinutes + amount;

  bool hasReadyInMinutes() => _readyInMinutes != null;

  // "servings" field.
  int? _servings;
  int get servings => _servings ?? 0;
  set servings(int? val) => _servings = val;

  void incrementServings(int amount) => servings = servings + amount;

  bool hasServings() => _servings != null;

  // "sourceUrl" field.
  String? _sourceUrl;
  String get sourceUrl => _sourceUrl ?? '';
  set sourceUrl(String? val) => _sourceUrl = val;

  bool hasSourceUrl() => _sourceUrl != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static MealsStruct fromMap(Map<String, dynamic> data) => MealsStruct(
        title: data['title'] as String?,
        readyInMinutes: castToType<int>(data['readyInMinutes']),
        servings: castToType<int>(data['servings']),
        sourceUrl: data['sourceUrl'] as String?,
        image: data['image'] as String?,
      );

  static MealsStruct? maybeFromMap(dynamic data) =>
      data is Map ? MealsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'readyInMinutes': _readyInMinutes,
        'servings': _servings,
        'sourceUrl': _sourceUrl,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'readyInMinutes': serializeParam(
          _readyInMinutes,
          ParamType.int,
        ),
        'servings': serializeParam(
          _servings,
          ParamType.int,
        ),
        'sourceUrl': serializeParam(
          _sourceUrl,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static MealsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MealsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        readyInMinutes: deserializeParam(
          data['readyInMinutes'],
          ParamType.int,
          false,
        ),
        servings: deserializeParam(
          data['servings'],
          ParamType.int,
          false,
        ),
        sourceUrl: deserializeParam(
          data['sourceUrl'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MealsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MealsStruct &&
        title == other.title &&
        readyInMinutes == other.readyInMinutes &&
        servings == other.servings &&
        sourceUrl == other.sourceUrl &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, readyInMinutes, servings, sourceUrl, image]);
}

MealsStruct createMealsStruct({
  String? title,
  int? readyInMinutes,
  int? servings,
  String? sourceUrl,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MealsStruct(
      title: title,
      readyInMinutes: readyInMinutes,
      servings: servings,
      sourceUrl: sourceUrl,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MealsStruct? updateMealsStruct(
  MealsStruct? meals, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meals
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMealsStructData(
  Map<String, dynamic> firestoreData,
  MealsStruct? meals,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meals == null) {
    return;
  }
  if (meals.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && meals.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mealsData = getMealsFirestoreData(meals, forFieldValue);
  final nestedData = mealsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meals.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMealsFirestoreData(
  MealsStruct? meals, [
  bool forFieldValue = false,
]) {
  if (meals == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meals.toMap());

  // Add any Firestore field values
  meals.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMealsListFirestoreData(
  List<MealsStruct>? mealss,
) =>
    mealss?.map((e) => getMealsFirestoreData(e, true)).toList() ?? [];
