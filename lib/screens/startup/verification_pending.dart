import 'package:flutter/material.dart';


class VerificationPending extends StatelessWidget {


  const VerificationPending({super.key});


  @override
  Widget build(BuildContext context){


    return Scaffold(

      appBar:
      AppBar(
        title:
        const Text(
            "Verification"
        ),
      ),


      body:
      Center(

        child:
        Column(

          mainAxisAlignment:
          MainAxisAlignment.center,


          children:[


            const Icon(
              Icons.pending,
              size:80,
            ),


            const SizedBox(height:20),


            const Text(

              "Your startup account is waiting for approval.",

              textAlign:
              TextAlign.center,


              style:
              TextStyle(
                  fontSize:20
              ),

            ),


            const SizedBox(height:10),


            const Text(

              "ALU administrators will review your startup information.",

              textAlign:
              TextAlign.center,

            ),


          ],


        ),


      ),


    );


  }


}