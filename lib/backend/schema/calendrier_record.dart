import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendrierRecord extends FirestoreRecord {
  CalendrierRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NameRendez" field.
  String? _nameRendez;
  String get nameRendez => _nameRendez ?? '';
  bool hasNameRendez() => _nameRendez != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _nameRendez = snapshotData['NameRendez'] as String?;
    _description = snapshotData['Description'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calendrier');

  static Stream<CalendrierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CalendrierRecord.fromSnapshot(s));

  static Future<CalendrierRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CalendrierRecord.fromSnapshot(s));

  static CalendrierRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CalendrierRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CalendrierRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CalendrierRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CalendrierRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CalendrierRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCalendrierRecordData({
  String? nameRendez,
  String? description,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NameRendez': nameRendez,
      'Description': description,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class CalendrierRecordDocumentEquality implements Equality<CalendrierRecord> {
  const CalendrierRecordDocumentEquality();

  @override
  bool equals(CalendrierRecord? e1, CalendrierRecord? e2) {
    return e1?.nameRendez == e2?.nameRendez &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date;
  }

  @override
  int hash(CalendrierRecord? e) =>
      const ListEquality().hash([e?.nameRendez, e?.description, e?.date]);

  @override
  bool isValidKey(Object? o) => o is CalendrierRecord;
}
