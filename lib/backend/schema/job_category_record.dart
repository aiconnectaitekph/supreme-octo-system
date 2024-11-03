import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobCategoryRecord extends FirestoreRecord {
  JobCategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('job_category');

  static Stream<JobCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobCategoryRecord.fromSnapshot(s));

  static Future<JobCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobCategoryRecord.fromSnapshot(s));

  static JobCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JobCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobCategoryRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobCategoryRecordDocumentEquality implements Equality<JobCategoryRecord> {
  const JobCategoryRecordDocumentEquality();

  @override
  bool equals(JobCategoryRecord? e1, JobCategoryRecord? e2) {
    return e1?.title == e2?.title;
  }

  @override
  int hash(JobCategoryRecord? e) => const ListEquality().hash([e?.title]);

  @override
  bool isValidKey(Object? o) => o is JobCategoryRecord;
}
