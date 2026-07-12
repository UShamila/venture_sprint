import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';
import '../services/notification_service.dart';



class NotificationProvider extends ChangeNotifier {


  final NotificationService _service =
  NotificationService();



  List<NotificationModel> notifications=[];



  void loadNotifications(
      String userId
      ){


    _service
        .getNotifications(userId)
        .listen((snapshot){


      notifications =
          snapshot.docs.map((doc){


            return NotificationModel.fromFirestore(
                doc.id,
                doc.data() as Map<String,dynamic>
            );


          }).toList();



      notifyListeners();


    });


  }





  int get unreadCount{


    return notifications
        .where(
            (e)=>!e.isRead
    )
        .length;


  }





  Future<void> markAsRead(
      String notificationId
      ) async{


    await _service.markAsRead(
        notificationId
    );


    notifyListeners();


  }



}