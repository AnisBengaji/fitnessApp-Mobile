import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BmrcalculationRecord extends FirestoreRecord {
  BmrcalculationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bmr" field.
  double? _bmr;
  double get bmr => _bmr ?? 0.0;
  bool hasBmr() => _bmr != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "activityLevel" field.
  String? _activityLevel;
  String get activityLevel => _activityLevel ?? '';
  bool hasActivityLevel() => _activityLevel != null;

  void _initializeFields() {
    _bmr = castToType<double>(snapshotData['bmr']);
    _age = castToType<int>(snapshotData['age']);
    _gender = snapshotData['gender'] as String?;
    _weight = castToType<double>(snapshotData['weight']);
    _height = castToType<double>(snapshotData['height']);
    _activityLevel = snapshotData['activityLevel'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bmrcalculation');

  static Stream<BmrcalculationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BmrcalculationRecord.fromSnapshot(s));

  static Future<BmrcalculationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BmrcalculationRecord.fromSnapshot(s));

  static BmrcalculationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BmrcalculationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BmrcalculationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BmrcalculationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BmrcalculationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BmrcalculationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBmrcalculationRecordData({
  double? bmr,
  int? age,
  String? gender,
  double? weight,
  double? height,
  String? activityLevel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bmr': bmr,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'activityLevel': activityLevel,
    }.withoutNulls,
  );

  return firestoreData;
}

class BmrcalculationRecordDocumentEquality
    implements Equality<BmrcalculationRecord> {
  const BmrcalculationRecordDocumentEquality();

  @override
  bool equals(BmrcalculationRecord? e1, BmrcalculationRecord? e2) {
    return e1?.bmr == e2?.bmr &&
        e1?.age == e2?.age &&
        e1?.gender == e2?.gender &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        e1?.activityLevel == e2?.activityLevel;
  }

  @override
  int hash(BmrcalculationRecord? e) => const ListEquality().hash(
      [e?.bmr, e?.age, e?.gender, e?.weight, e?.height, e?.activityLevel]);

  @override
  bool isValidKey(Object? o) => o is BmrcalculationRecord;
}
