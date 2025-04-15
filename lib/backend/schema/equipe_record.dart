import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EquipeRecord extends FirestoreRecord {
  EquipeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "admin" field.
  DocumentReference? _admin;
  DocumentReference? get admin => _admin;
  bool hasAdmin() => _admin != null;

  // "membres" field.
  List<DocumentReference>? _membres;
  List<DocumentReference> get membres => _membres ?? const [];
  bool hasMembres() => _membres != null;

  // "private" field.
  bool? _private;
  bool get private => _private ?? false;
  bool hasPrivate() => _private != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "pendingMembers" field.
  List<DocumentReference>? _pendingMembers;
  List<DocumentReference> get pendingMembers => _pendingMembers ?? const [];
  bool hasPendingMembers() => _pendingMembers != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _admin = snapshotData['admin'] as DocumentReference?;
    _membres = getDataList(snapshotData['membres']);
    _private = snapshotData['private'] as bool?;
    _description = snapshotData['description'] as String?;
    _pendingMembers = getDataList(snapshotData['pendingMembers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('equipe');

  static Stream<EquipeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EquipeRecord.fromSnapshot(s));

  static Future<EquipeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EquipeRecord.fromSnapshot(s));

  static EquipeRecord fromSnapshot(DocumentSnapshot snapshot) => EquipeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EquipeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EquipeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EquipeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EquipeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEquipeRecordData({
  String? name,
  DocumentReference? admin,
  bool? private,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'admin': admin,
      'private': private,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class EquipeRecordDocumentEquality implements Equality<EquipeRecord> {
  const EquipeRecordDocumentEquality();

  @override
  bool equals(EquipeRecord? e1, EquipeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.admin == e2?.admin &&
        listEquality.equals(e1?.membres, e2?.membres) &&
        e1?.private == e2?.private &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.pendingMembers, e2?.pendingMembers);
  }

  @override
  int hash(EquipeRecord? e) => const ListEquality().hash([
        e?.name,
        e?.admin,
        e?.membres,
        e?.private,
        e?.description,
        e?.pendingMembers
      ]);

  @override
  bool isValidKey(Object? o) => o is EquipeRecord;
}
