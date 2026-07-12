import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/opportunity_service.dart';
import '../services/application_service.dart';

class StartupDashboardProvider extends ChangeNotifier {

  final OpportunityService _opportunityService = OpportunityService();
  final ApplicationService _applicationService = ApplicationService();

  int active = 0;
  int applicants = 0;
  int accepted = 0;
  int pending = 0;

  bool loading = true;

  Future<void> loadDashboard() async {

    loading = true;
    notifyListeners();

    final uid = FirebaseAuth.instance.currentUser!.uid;

    active = await _opportunityService.getActiveOpportunityCount(uid);

    applicants = await _applicationService.getApplicantCount(uid);

    accepted = await _applicationService.getAcceptedCount(uid);

    pending = await _applicationService.getPendingCount(uid);

    loading = false;
    notifyListeners();
  }
}