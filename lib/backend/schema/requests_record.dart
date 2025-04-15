import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "person" field.
  DocumentReference? _person;
  DocumentReference? get person => _person;
  bool hasPerson() => _person != null;

  // "group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "groupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "personName" field.
  String? _personName;
  String get personName => _personName ?? '';
  bool hasPersonName() => _personName != null;

  // "personImage" field.
  String? _personImage;
  String get personImage => _personImage ?? '';
  bool hasPersonImage() => _personImage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _person = snapshotData['person'] as DocumentReference?;
    _group = snapshotData['group'] as DocumentReference?;
    _groupName = snapshotData['groupName'] as String?;
    _personName = snapshotData['personName'] as String?;
    _personImage = snapshotData['personImage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('requests')
          : FirebaseFirestore.instance.collectionGroup('requests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('requests').doc(id);

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  DocumentReference? person,
  DocumentReference? group,
  String? groupName,
  String? personName,
  String? personImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'person': person,
      'group': group,
      'groupName': groupName,
      'personName': personName,
      'personImage': personImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.person == e2?.person &&
        e1?.group == e2?.group &&
        e1?.groupName == e2?.groupName &&
        e1?.personName == e2?.personName &&
        e1?.personImage == e2?.personImage;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality()
      .hash([e?.person, e?.group, e?.groupName, e?.personName, e?.personImage]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
