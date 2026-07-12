import 'package:flutter/material.dart';


class VerificationBadge extends StatelessWidget {


  final bool verified;


  const VerificationBadge({

    super.key,

    required this.verified,

  });



  @override
  Widget build(BuildContext context) {


    if(!verified){

      return const SizedBox();

    }


    return Container(

      padding:
      const EdgeInsets.symmetric(
        horizontal:10,
        vertical:5,
      ),


      decoration:

      BoxDecoration(

        color:
        Colors.blue.shade50,

        borderRadius:
        BorderRadius.circular(20),

      ),



      child:

      const Row(

        mainAxisSize:
        MainAxisSize.min,


        children:[


          Icon(

            Icons.verified,

            color:
            Colors.blue,

            size:18,

          ),



          SizedBox(width:5),



          Text(

            "Verified",

            style:

            TextStyle(

              color:
              Colors.blue,

              fontWeight:
              FontWeight.bold,

            ),

          )

        ],

      ),

    );


  }


}