import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TemplateRecord extends FirestoreRecord {
  TemplateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "exercisesRefs" field.
  List<DocumentReference>? _exercisesRefs;
  List<DocumentReference> get exercisesRefs => _exercisesRefs ?? const [];
  bool hasExercisesRefs() => _exercisesRefs != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _exercisesRefs = getDataList(snapshotData['exercisesRefs']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('template');

  static Stream<TemplateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TemplateRecord.fromSnapshot(s));

  static Future<TemplateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TemplateRecord.fromSnapshot(s));

  static TemplateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TemplateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TemplateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TemplateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TemplateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TemplateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTemplateRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class TemplateRecordDocumentEquality implements Equality<TemplateRecord> {
  const TemplateRecordDocumentEquality();

  @override
  bool equals(TemplateRecord? e1, TemplateRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.exercisesRefs, e2?.exercisesRefs);
  }

  @override
  int hash(TemplateRecord? e) =>
      const ListEquality().hash([e?.name, e?.exercisesRefs]);

  @override
  bool isValidKey(Object? o) => o is TemplateRecord;
}
