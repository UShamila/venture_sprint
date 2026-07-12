import 'package:flutter/material.dart';

import '../services/startup_service.dart';

import '../models/startup_model.dart';



class StartupProvider extends ChangeNotifier{


  final StartupService _service =
  StartupService();


  StartupModel? startup;


  bool loading=false;



  Future<void> loadStartup(
      String uid
      ) async{


    loading=true;

    notifyListeners();


    final snapshot =
    await _service.getStartup(uid);



    startup =
        StartupModel.fromMap(
            snapshot.data()
            as Map<String,dynamic>
        );



    loading=false;

    notifyListeners();


  }





  Future<void> updateProfile(

      String uid,

      Map<String,dynamic> data

      ) async{


    await _service.updateStartup(
        uid,
        data
    );


    await loadStartup(uid);


  }



}