import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreResponse {
  final List? listData;
  final Map<String, dynamic>? docData;
  final DocumentSnapshot<Object?>? lastDocumentSnapshot;
  final bool? hasMore;
  FireStoreResponse({
    this.listData,
    this.docData,
    this.lastDocumentSnapshot,
    this.hasMore,
  });
}
