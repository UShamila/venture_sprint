import 'package:cloud_firestore/cloud_firestore.dart';


class InterviewModel {


  final String id;

  final String studentId;

  final String startupId;

  final String applicationId;

  final String date;

  final String time;

  final String meetingLink;

  final String notes;

  final String status;



  InterviewModel({

    required this.id,

    required this.studentId,

    required this.startupId,

    required this.applicationId,

    required this.date,

    required this.time,

    required this.meetingLink,

    required this.notes,

    required this.status,

  });




  factory InterviewModel.fromFirestore(
      DocumentSnapshot doc
      ){

    final data =
    doc.data() as Map<String,dynamic>;


    return InterviewModel(

      id:doc.id,

      studentId:
      data["studentId"] ?? "",


      startupId:
      data["startupId"] ?? "",


      applicationId:
      data["applicationId"] ?? "",


      date:
      data["date"] ?? "",


      time:
      data["time"] ?? "",


      meetingLink:
      data["meetingLink"] ?? "",


      notes:
      data["notes"] ?? "",


      status:
      data["status"] ?? "Scheduled",

    );


  }


}