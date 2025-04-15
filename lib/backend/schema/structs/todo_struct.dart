// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TodoStruct extends FFFirebaseStruct {
  TodoStruct({
    String? title,
    String? description,
    DateTime? date,
    bool? isCompleted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _date = date,
        _isCompleted = isCompleted,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  set isCompleted(bool? val) => _isCompleted = val;

  bool hasIsCompleted() => _isCompleted != null;

  static TodoStruct fromMap(Map<String, dynamic> data) => TodoStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        date: data['date'] as DateTime?,
        isCompleted: data['isCompleted'] as bool?,
      );

  static TodoStruct? maybeFromMap(dynamic data) =>
      data is Map ? TodoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'date': _date,
        'isCompleted': _isCompleted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'isCompleted': serializeParam(
          _isCompleted,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TodoStruct fromSerializableMap(Map<String, dynamic> data) =>
      TodoStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        isCompleted: deserializeParam(
          data['isCompleted'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TodoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TodoStruct &&
        title == other.title &&
        description == other.description &&
        date == other.date &&
        isCompleted == other.isCompleted;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, description, date, isCompleted]);
}

TodoStruct createTodoStruct({
  String? title,
  String? description,
  DateTime? date,
  bool? isCompleted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TodoStruct(
      title: title,
      description: description,
      date: date,
      isCompleted: isCompleted,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TodoStruct? updateTodoStruct(
  TodoStruct? todo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    todo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTodoStructData(
  Map<String, dynamic> firestoreData,
  TodoStruct? todo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (todo == null) {
    return;
  }
  if (todo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && todo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final todoData = getTodoFirestoreData(todo, forFieldValue);
  final nestedData = todoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = todo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTodoFirestoreData(
  TodoStruct? todo, [
  bool forFieldValue = false,
]) {
  if (todo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(todo.toMap());

  // Add any Firestore field values
  todo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTodoListFirestoreData(
  List<TodoStruct>? todos,
) =>
    todos?.map((e) => getTodoFirestoreData(e, true)).toList() ?? [];
