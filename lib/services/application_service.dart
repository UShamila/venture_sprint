import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> apply({
    required String opportunityId,
    required String studentId,
    required String startupId,
    required String studentName,
    required String studentEmail,
    required String opportunityTitle,
  }) async {
    await _db.collection("applications").add({
      "opportunityId": opportunityId,
      "studentId": studentId,
      "startupId": startupId,
      "studentName": studentName,
      "studentEmail": studentEmail,
      "opportunityTitle": opportunityTitle,
      "status": "pending",
      "createdAt": Timestamp.now(),
    });

    // Create notification for the startup
    await _db.collection("notifications").add({
      "userId": startupId,
      "title": "New Application",
      "message": "$studentName applied for $opportunityTitle",
      "type": "application",
      "isRead": false,
      "createdAt": Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getStudentApplications(String studentId) {
    return _db
        .collection("applications")
        .where("studentId", isEqualTo: studentId)
        .snapshots();
  }

  Stream<QuerySnapshot> getStartupApplications(String startupId) {
    return _db
        .collection("applications")
        .where("startupId", isEqualTo: startupId)
        .snapshots();
  }

  Future<void> updateStatus(
      String applicationId,
      String status,
      String studentId,
      ) async {
    await _db.collection("applications").doc(applicationId).update({
      "status": status,
    });

    // Notify student about application status change
    await _db.collection("notifications").add({
      "userId": studentId,
      "title": "Application Update",
      "message": "Your application has been $status",
      "type": "application",
      "isRead": false,
      "createdAt": Timestamp.now(),
    });
  }

  Future<bool> canApply(
      String opportunityId,
      String studentId,
      ) async {
    final result = await _db
        .collection("applications")
        .where("opportunityId", isEqualTo: opportunityId)
        .where("studentId", isEqualTo: studentId)
        .get();

    return result.docs.isEmpty;
  }

  /// Returns total number of applicants for a startup.
  Future<int> getApplicantCount(String startupId) async {
    final snapshot = await _db
        .collection("applications")
        .where("startupId", isEqualTo: startupId)
        .get();

    return snapshot.docs.length;
  }

  /// Returns total number of accepted applications.
  Future<int> getAcceptedCount(String startupId) async {
    final snapshot = await _db
        .collection("applications")
        .where("startupId", isEqualTo: startupId)
        .where("status", isEqualTo: "Accepted")
        .get();

    return snapshot.docs.length;
  }

  /// Returns total number of pending applications.
  Future<int> getPendingCount(String startupId) async {
    final snapshot = await _db
        .collection("applications")
        .where("startupId", isEqualTo: startupId)
        .where("status", isEqualTo: "Pending")
        .get();

    return snapshot.docs.length;
  }
}