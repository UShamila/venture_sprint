import 'package:flutter/material.dart';

import '../models/student_model.dart';
import '../services/student_service.dart';

class StudentProvider extends ChangeNotifier {
  final StudentService _service = StudentService();

  StudentModel? student;

  bool loading = false;

  /// Returns profile completion as a percentage (0-100)
  double get profileCompletion {
    if (student == null) return 0;

    int completed = 0;
    const int total = 7;

    if (student!.name.isNotEmpty) completed++;

    if (student!.bio != null && student!.bio!.isNotEmpty) {
      completed++;
    }

    if (student!.educationLevel != null &&
        student!.educationLevel!.isNotEmpty) {
      completed++;
    }

    if (student!.fieldOfStudy != null &&
        student!.fieldOfStudy!.isNotEmpty) {
      completed++;
    }

    if (student!.github != null && student!.github!.isNotEmpty) {
      completed++;
    }

    if (student!.linkedin != null && student!.linkedin!.isNotEmpty) {
      completed++;
    }

    if (student!.skills != null && student!.skills!.isNotEmpty) {
      completed++;
    }

    return completed / total;
  }

  Future<void> loadStudent(String uid) async {
    loading = true;
    notifyListeners();

    final snapshot = await _service.getStudent(uid);

    if (snapshot.exists && snapshot.data() != null) {
      student = StudentModel.fromMap(
        snapshot.data() as Map<String, dynamic>,
      );
    } else {
      student = null;
    }

    loading = false;
    notifyListeners();
  }

  Future<void> updateProfile(
      String uid,
      Map<String, dynamic> data,
      ) async {
    await _service.updateProfile(uid, data);

    await loadStudent(uid);
  }
}