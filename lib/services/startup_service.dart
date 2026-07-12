import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class StartupService {


  static const String onboardingKey =
      "hasSeenOnboarding";


  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;



  Future<bool> hasSeenOnboarding() async {


    final prefs =
    await SharedPreferences.getInstance();


    return prefs.getBool(onboardingKey) ?? false;


  }



  Future<void> completeOnboarding() async {


    final prefs =
    await SharedPreferences.getInstance();


    await prefs.setBool(
        onboardingKey,
        true
    );


  }




  Future<DocumentSnapshot> getStartup(

      String uid

      ) async {


    return await _firestore
        .collection("users")
        .doc(uid)
        .get();


  }




  Future<void> updateStartup(

      String uid,

      Map<String, dynamic> data

      ) async {


    await _firestore
        .collection("users")
        .doc(uid)
        .update(data);


  }


}