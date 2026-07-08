import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();

}



class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();


    Future.delayed(
      const Duration(seconds: 8),
          () {

        Navigator.pushReplacementNamed(
            context,
            "/login"
        );

      },
    );

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            Icon(
              Icons.rocket_launch,
              size: 80,
              color: Colors.deepPurple,
            ),


            const SizedBox(height: 20),


            const Text(
              "VentureSprint",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 10),


            const Text(
              "Connecting ALU talent with opportunities",
            ),


          ],

        ),

      ),

    );

  }

}