import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getCurrentUser(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();

    return doc.data();
  }

  Future<String?> getVerificationStatus(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();

    return doc.data()?["verificationStatus"];
  }

  Future<void> approveStartup(String uid) async {
    await _db.collection("users").doc(uid).update({
      "verificationStatus": "approved",
    });
  }

  Future<void> rejectStartup(String uid) async {
    await _db.collection("users").doc(uid).update({
      "verificationStatus": "rejected",
    });
  }
}