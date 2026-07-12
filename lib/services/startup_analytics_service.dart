import 'package:cloud_firestore/cloud_firestore.dart';



class StartupAnalyticsService {



  final FirebaseFirestore _db =
      FirebaseFirestore.instance;



  Future<Map<String,dynamic>> getAnalytics(
      String startupId
      ) async {



    final opportunities =
    await _db
        .collection("opportunities")
        .where(
        "startupId",
        isEqualTo: startupId
    )
        .get();



    final applications =
    await _db
        .collection("applications")
        .where(
        "startupId",
        isEqualTo: startupId
    )
        .get();



    int pending=0;

    int accepted=0;



    for(var doc in applications.docs){


      final status =
      doc["status"];



      if(status=="pending"){

        pending++;

      }


      if(status=="accepted"){

        accepted++;

      }


    }




    return {


      "opportunities":
      opportunities.docs.length,


      "applicants":
      applications.docs.length,


      "pending":
      pending,


      "accepted":
      accepted,


    };



  }



}