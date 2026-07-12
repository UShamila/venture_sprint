import 'package:flutter/material.dart';
import '../../services/startup_service.dart';
import '../../services/auth_service.dart';



class SplashScreen extends StatefulWidget {


  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();


}




class _SplashScreenState
    extends State<SplashScreen>{


  final StartupService startupService =
  StartupService();


  final AuthService authService =
  AuthService();




  @override
  void initState(){

    super.initState();

    checkApp();


  }




  Future<void> checkApp() async{


    await Future.delayed(
        const Duration(seconds:2)
    );



    bool seen =
    await startupService.hasSeenOnboarding();



    if(authService.currentUser != null){


      String? role =
      await authService.getUserRole();



      if(!mounted) return;



      if(role=="student"){


        Navigator.pushReplacementNamed(
            context,
            "/student"
        );


      }


      else if(role=="startup"){


        Navigator.pushReplacementNamed(
            context,
            "/startup"
        );


      }



    }



    else{


      if(!seen){


        Navigator.pushReplacementNamed(
            context,
            "/onboarding"
        );


      }

      else{


        Navigator.pushReplacementNamed(
            context,
            "/login"
        );


      }


    }



  }




  @override
  Widget build(BuildContext context){


    return Scaffold(

      body:Center(

        child:Column(

          mainAxisAlignment:
          MainAxisAlignment.center,


          children:[


            const Icon(

              Icons.rocket_launch,

              size:90,

              color:Colors.deepPurple,

            ),



            const SizedBox(height:20),



            const Text(

              "VentureSprint",

              style:TextStyle(

                fontSize:32,

                fontWeight:
                FontWeight.bold,

              ),

            )



          ],

        ),

      ),


    );


  }


}