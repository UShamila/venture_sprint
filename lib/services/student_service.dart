import 'package:cloud_firestore/cloud_firestore.dart';


class StudentService {


  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;



  Future<DocumentSnapshot> getStudent(
      String uid
      ) async {


    return await _firestore
        .collection("users")
        .doc(uid)
        .get();


  }





  Future<void> updateProfile(

      String uid,

      Map<String,dynamic> data

      ) async{


    await _firestore
        .collection("users")
        .doc(uid)
        .update(data);


  }



}