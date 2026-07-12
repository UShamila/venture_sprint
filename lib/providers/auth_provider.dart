import 'package:flutter/material.dart';
import '../services/auth_service.dart';



class AuthProvider extends ChangeNotifier {


  final AuthService _service =
  AuthService();



  bool isLoading=false;



  String? error;



  Future<bool> register({

    required String name,

    required String email,

    required String password,

    required String role,

  }) async {


    try{


      isLoading=true;
      error=null;
      notifyListeners();



      await _service.register(

        name:name,

        email:email,

        password:password,

        role:role,

      );



      isLoading=false;
      notifyListeners();


      return true;



    }catch(e){


      error=e.toString();

      isLoading=false;

      notifyListeners();


      return false;


    }


  }


  Future<bool> login(
      String email,
      String password,
      ) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      await _service.login(email, password);

      isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      error = e.toString();

      isLoading = false;
      notifyListeners();

      return false;
    }
  }


  Future<void> resetPassword(
      String email
      ) async{


    await _service.resetPassword(email);


  }

  Future<String?> getRole() async {
    return await _service.getUserRole();
  }

  Future<void> logout() async {

    await _service.logout();

    notifyListeners();

  }


}