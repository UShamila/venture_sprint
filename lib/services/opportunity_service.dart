import 'package:cloud_firestore/cloud_firestore.dart';

class OpportunityService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getOpportunities() {
    return _firestore
        .collection("opportunities")
        .where(
      "isActive",
      isEqualTo: true,
    )
        .snapshots();
  }

  Future<void> createOpportunity(
      Map<String, dynamic> data,
      ) async {
    await _firestore
        .collection("opportunities")
        .add(data);
  }

  Future<void> deleteOpportunity(
      String id,
      ) async {
    await _firestore
        .collection("opportunities")
        .doc(id)
        .delete();
  }

  // Returns the number of active opportunities posted by a startup
  Future<int> getActiveOpportunityCount(
      String startupId,
      ) async {
    final snapshot = await _firestore
        .collection("opportunities")
        .where(
      "startupId",
      isEqualTo: startupId,
    )
        .where(
      "isActive",
      isEqualTo: true,
    )
        .get();

    return snapshot.docs.length;
  }

  // Returns the 5 most recent opportunities posted by a startup
  Future<List<QueryDocumentSnapshot>> getRecentStartupOpportunities(
      String startupId,
      ) async {
    final snapshot = await _firestore
        .collection("opportunities")
        .where(
      "startupId",
      isEqualTo: startupId,
    )
        .orderBy(
      "createdAt",
      descending: true,
    )
        .limit(5)
        .get();

    return snapshot.docs;
  }
}