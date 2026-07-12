import 'package:cloud_firestore/cloud_firestore.dart';


class ApplicationModel {


  final String id;

  final String opportunityId;

  final String studentId;

  final String startupId;

  final String studentName;

  final String studentEmail;

  final String opportunityTitle;

  final String status;

  final DateTime createdAt;


  final String? interviewDate;

  final String? interviewLink;

  final String? interviewNotes;



  ApplicationModel({


    required this.id,

    required this.opportunityId,

    required this.studentId,

    required this.startupId,

    required this.studentName,

    required this.studentEmail,

    required this.opportunityTitle,

    required this.status,

    required this.createdAt,


    this.interviewDate,

    this.interviewLink,

    this.interviewNotes,


  });






  factory ApplicationModel.fromFirestore(
      DocumentSnapshot doc,
      ) {


    final data =
    doc.data() as Map<String, dynamic>;



    return ApplicationModel(



      id:
      doc.id,

      opportunityId:
      data["opportunityId"] ?? "",

      studentId:
      data["studentId"] ?? "",



      startupId:
      data["startupId"] ?? "",



      studentName:
      data["studentName"] ?? "",



      studentEmail:
      data["studentEmail"] ?? "",



      opportunityTitle:
      data["opportunityTitle"] ?? "",



      status:
      data["status"] ?? "Submitted",




      createdAt:

      data["createdAt"] != null

          ? (data["createdAt"] as Timestamp).toDate()

          :

      DateTime.now(),





      interviewDate:
      data["interviewDate"],



      interviewLink:
      data["interviewLink"],



      interviewNotes:
      data["interviewNotes"],



    );


  }






  Map<String, dynamic> toFirestore() {


    return {


      "opportunityId":
      opportunityId,


      "studentId":
      studentId,


      "startupId":
      startupId,


      "studentName":
      studentName,


      "studentEmail":
      studentEmail,


      "opportunityTitle":
      opportunityTitle,


      "status":
      status,


      "createdAt":
      Timestamp.fromDate(createdAt),



      "interviewDate":
      interviewDate,


      "interviewLink":
      interviewLink,


      "interviewNotes":
      interviewNotes,



    };


  }



}