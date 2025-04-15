import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TodoRecord extends FirestoreRecord {
  TodoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "datedep" field.
  DateTime? _datedep;
  DateTime? get datedep => _datedep;
  bool hasDatedep() => _datedep != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _datedep = snapshotData['datedep'] as DateTime?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _user = snapshotData['User'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('todo');

  static Stream<TodoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TodoRecord.fromSnapshot(s));

  static Future<TodoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TodoRecord.fromSnapshot(s));

  static TodoRecord fromSnapshot(DocumentSnapshot snapshot) => TodoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TodoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TodoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TodoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TodoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTodoRecordData({
  String? title,
  String? description,
  DateTime? datedep,
  bool? isCompleted,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'datedep': datedep,
      'isCompleted': isCompleted,
      'User': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class TodoRecordDocumentEquality implements Equality<TodoRecord> {
  const TodoRecordDocumentEquality();

  @override
  bool equals(TodoRecord? e1, TodoRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.datedep == e2?.datedep &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.user == e2?.user;
  }

  @override
  int hash(TodoRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.datedep, e?.isCompleted, e?.user]);

  @override
  bool isValidKey(Object? o) => o is TodoRecord;
}
