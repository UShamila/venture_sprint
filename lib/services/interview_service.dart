import 'package:cloud_firestore/cloud_firestore.dart';


class InterviewService{


  final FirebaseFirestore _db =
      FirebaseFirestore.instance;



  Future<void> scheduleInterview({

    required String studentId,

    required String startupId,

    required String applicationId,

    required String date,

    required String time,

    required String meetingLink,

    required String notes,

  }) async{


    await _db
        .collection("interviews")
        .add({

      "studentId":
      studentId,


      "startupId":
      startupId,


      "applicationId":
      applicationId,


      "date":
      date,


      "time":
      time,


      "meetingLink":
      meetingLink,


      "notes":
      notes,


      "status":
      "Scheduled",


      "createdAt":
      Timestamp.now(),


    });


  }



  Stream<QuerySnapshot> getStudentInterviews(
      String studentId
      ){

    return _db
        .collection("interviews")
        .where(
      "studentId",
      isEqualTo: studentId,
    )
        .snapshots();

  }



}