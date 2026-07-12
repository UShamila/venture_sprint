import 'package:cloud_firestore/cloud_firestore.dart';



class NotificationService {


  final FirebaseFirestore _db =
      FirebaseFirestore.instance;



  Future<void> createNotification({

    required String userId,

    required String title,

    required String message,

    required String type,

  }) async{


    await _db

        .collection("notifications")

        .add({

      "userId":

      userId,


      "title":

      title,


      "message":

      message,


      "type":

      type,


      "isRead":

      false,


      "createdAt":

      Timestamp.now(),


    });


  }




  Stream<QuerySnapshot> getNotifications(
      String userId
      ){

    return _db

        .collection("notifications")

        .where(
        "userId",
        isEqualTo:userId
    )

        .orderBy(
        "createdAt",
        descending:true
    )

        .snapshots();

  }




  Future<void> markAsRead(
      String id
      ) async{


    await _db

        .collection("notifications")

        .doc(id)

        .update({

      "isRead":
      true

    });


  }


}