import 'package:flutter/material.dart';
import '../services/startup_analytics_service.dart';


class StartupAnalyticsProvider extends ChangeNotifier {


  final StartupAnalyticsService _service =
  StartupAnalyticsService();



  int opportunities = 0;

  int applicants = 0;

  int pending = 0;

  int accepted = 0;


  bool loading = false;




  Future<void> loadAnalytics(String startupId) async {


    loading = true;

    notifyListeners();



    final data =
    await _service.getAnalytics(startupId);



    opportunities =
    data["opportunities"];


    applicants =
    data["applicants"];


    pending =
    data["pending"];


    accepted =
    data["accepted"];



    loading=false;

    notifyListeners();


  }



}