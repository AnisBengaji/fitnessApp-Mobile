import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutsRecord extends FirestoreRecord {
  WorkoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "exercises" field.
  List<ExercisesStruct>? _exercises;
  List<ExercisesStruct> get exercises => _exercises ?? const [];
  bool hasExercises() => _exercises != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _exercises = getStructList(
      snapshotData['exercises'],
      ExercisesStruct.fromMap,
    );
    _duration = castToType<int>(snapshotData['duration']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Workouts')
          : FirebaseFirestore.instance.collectionGroup('Workouts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Workouts').doc(id);

  static Stream<WorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutsRecord.fromSnapshot(s));

  static Future<WorkoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutsRecord.fromSnapshot(s));

  static WorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutsRecordData({
  String? name,
  DateTime? timestamp,
  int? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'timestamp': timestamp,
      'duration': duration,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutsRecordDocumentEquality implements Equality<WorkoutsRecord> {
  const WorkoutsRecordDocumentEquality();

  @override
  bool equals(WorkoutsRecord? e1, WorkoutsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.exercises, e2?.exercises) &&
        e1?.duration == e2?.duration;
  }

  @override
  int hash(WorkoutsRecord? e) => const ListEquality()
      .hash([e?.name, e?.timestamp, e?.exercises, e?.duration]);

  @override
  bool isValidKey(Object? o) => o is WorkoutsRecord;
}
