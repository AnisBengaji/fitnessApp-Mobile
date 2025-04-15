import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "person" field.
  DocumentReference? _person;
  DocumentReference? get person => _person;
  bool hasPerson() => _person != null;

  // "acceptedRequest" field.
  DocumentReference? _acceptedRequest;
  DocumentReference? get acceptedRequest => _acceptedRequest;
  bool hasAcceptedRequest() => _acceptedRequest != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "reciever" field.
  DocumentReference? _reciever;
  DocumentReference? get reciever => _reciever;
  bool hasReciever() => _reciever != null;

  // "personName" field.
  String? _personName;
  String get personName => _personName ?? '';
  bool hasPersonName() => _personName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _seen = snapshotData['seen'] as bool?;
    _person = snapshotData['person'] as DocumentReference?;
    _acceptedRequest = snapshotData['acceptedRequest'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _reciever = snapshotData['reciever'] as DocumentReference?;
    _personName = snapshotData['personName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notification')
          : FirebaseFirestore.instance.collectionGroup('notification');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notification').doc(id);

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? type,
  bool? seen,
  DocumentReference? person,
  DocumentReference? acceptedRequest,
  DateTime? time,
  DocumentReference? reciever,
  String? personName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'seen': seen,
      'person': person,
      'acceptedRequest': acceptedRequest,
      'time': time,
      'reciever': reciever,
      'personName': personName,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.seen == e2?.seen &&
        e1?.person == e2?.person &&
        e1?.acceptedRequest == e2?.acceptedRequest &&
        e1?.time == e2?.time &&
        e1?.reciever == e2?.reciever &&
        e1?.personName == e2?.personName;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.type,
        e?.seen,
        e?.person,
        e?.acceptedRequest,
        e?.time,
        e?.reciever,
        e?.personName
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
