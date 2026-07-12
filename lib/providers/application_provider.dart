import 'package:flutter/material.dart';
import '../services/application_service.dart';
import '../models/application_model.dart';



class ApplicationProvider extends ChangeNotifier {


  final ApplicationService _service =
  ApplicationService();



  bool loading = false;



  List<ApplicationModel> applications = [];




  Future<void> apply({

    required String opportunityId,

    required String studentId,

    required String startupId,

    required String studentName,

    required String studentEmail,

    required String opportunityTitle,


  }) async {


    loading = true;

    notifyListeners();



    await _service.apply(


      opportunityId:
      opportunityId,


      studentId:
      studentId,


      startupId:
      startupId,


      studentName:
      studentName,


      studentEmail:
      studentEmail,


      opportunityTitle:
      opportunityTitle,


    );



    loading = false;

    notifyListeners();


  }







  Future<bool> canApply(

      String opportunityId,

      String studentId,

      ) async {


    return await _service.canApply(

      opportunityId,

      studentId,

    );


  }









  Stream<List<ApplicationModel>> studentApplications(

      String studentId

      ) {


    return _service

        .getStudentApplications(studentId)

        .map((snapshot) {


      return snapshot.docs.map((doc) {


        return ApplicationModel.fromFirestore(

            doc

        );


      }).toList()
          .cast<ApplicationModel>();


    });


  }









  Stream<List<ApplicationModel>> startupApplications(

      String startupId

      ) {


    return _service

        .getStartupApplications(startupId)

        .map((snapshot) {


      return snapshot.docs.map((doc) {


        return ApplicationModel.fromFirestore(

            doc

        );


      }).toList()
          .cast<ApplicationModel>();


    });


  }









  Future<void> updateStatus(

      String id,

      String status,

      String studentId,

      ) async {


    await _service.updateStatus(

      id,

      status,

      studentId,

    );


    notifyListeners();


  }









  Future<void> loadStudentApplications(

      String studentId

      ) async {



    studentApplications(studentId)

        .listen((data){



      applications = data;


      notifyListeners();


    });


  }









  Future<void> loadStartupApplications(

      String startupId

      ) async {



    startupApplications(startupId)

        .listen((data){



      applications = data;


      notifyListeners();


    });


  }



}