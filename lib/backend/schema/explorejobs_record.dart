import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExplorejobsRecord extends FirestoreRecord {
  ExplorejobsRecord._(
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

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "salary" field.
  int? _salary;
  int get salary => _salary ?? 0;
  bool hasSalary() => _salary != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "posted_by" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  bool hasPostedBy() => _postedBy != null;

  // "company_logo" field.
  String? _companyLogo;
  String get companyLogo => _companyLogo ?? '';
  bool hasCompanyLogo() => _companyLogo != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _companyName = snapshotData['company_name'] as String?;
    _location = snapshotData['location'] as String?;
    _salary = castToType<int>(snapshotData['salary']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _postedBy = snapshotData['posted_by'] as DocumentReference?;
    _companyLogo = snapshotData['company_logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('explorejobs');

  static Stream<ExplorejobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExplorejobsRecord.fromSnapshot(s));

  static Future<ExplorejobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExplorejobsRecord.fromSnapshot(s));

  static ExplorejobsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExplorejobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExplorejobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExplorejobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExplorejobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExplorejobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExplorejobsRecordData({
  String? title,
  String? description,
  String? companyName,
  String? location,
  int? salary,
  DateTime? createdAt,
  DocumentReference? postedBy,
  String? companyLogo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'company_name': companyName,
      'location': location,
      'salary': salary,
      'created_at': createdAt,
      'posted_by': postedBy,
      'company_logo': companyLogo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExplorejobsRecordDocumentEquality implements Equality<ExplorejobsRecord> {
  const ExplorejobsRecordDocumentEquality();

  @override
  bool equals(ExplorejobsRecord? e1, ExplorejobsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.companyName == e2?.companyName &&
        e1?.location == e2?.location &&
        e1?.salary == e2?.salary &&
        e1?.createdAt == e2?.createdAt &&
        e1?.postedBy == e2?.postedBy &&
        e1?.companyLogo == e2?.companyLogo;
  }

  @override
  int hash(ExplorejobsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.companyName,
        e?.location,
        e?.salary,
        e?.createdAt,
        e?.postedBy,
        e?.companyLogo
      ]);

  @override
  bool isValidKey(Object? o) => o is ExplorejobsRecord;
}
