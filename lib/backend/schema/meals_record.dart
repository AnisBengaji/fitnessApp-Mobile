import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// collection for meals
class MealsRecord extends FirestoreRecord {
  MealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mealName" field.
  String? _mealName;
  String get mealName => _mealName ?? '';
  bool hasMealName() => _mealName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _mealName = snapshotData['mealName'] as String?;
    _description = snapshotData['description'] as String?;
    _type = snapshotData['type'] as String?;
    _calories = castToType<double>(snapshotData['calories']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meals');

  static Stream<MealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealsRecord.fromSnapshot(s));

  static Future<MealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealsRecord.fromSnapshot(s));

  static MealsRecord fromSnapshot(DocumentSnapshot snapshot) => MealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealsRecordData({
  String? mealName,
  String? description,
  String? type,
  double? calories,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mealName': mealName,
      'description': description,
      'type': type,
      'calories': calories,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealsRecordDocumentEquality implements Equality<MealsRecord> {
  const MealsRecordDocumentEquality();

  @override
  bool equals(MealsRecord? e1, MealsRecord? e2) {
    return e1?.mealName == e2?.mealName &&
        e1?.description == e2?.description &&
        e1?.type == e2?.type &&
        e1?.calories == e2?.calories &&
        e1?.image == e2?.image;
  }

  @override
  int hash(MealsRecord? e) => const ListEquality()
      .hash([e?.mealName, e?.description, e?.type, e?.calories, e?.image]);

  @override
  bool isValidKey(Object? o) => o is MealsRecord;
}
