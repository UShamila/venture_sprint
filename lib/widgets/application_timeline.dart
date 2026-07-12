import 'package:flutter/material.dart';


class ApplicationTimeline extends StatelessWidget {


  final String status;


  const ApplicationTimeline({

    super.key,

    required this.status,

  });



  @override
  Widget build(BuildContext context){


    final steps=[

      "Submitted",

      "Under Review",

      "Interview Scheduled",

      "Accepted",

    ];


    int current =
    steps.indexOf(status);



    return Column(

      children:

      steps.asMap().entries.map((entry){


        int index=entry.key;

        String text=entry.value;



        return ListTile(

          leading:

          CircleAvatar(

            backgroundColor:

            index<=current

                ?

            Colors.green

                :

            Colors.grey,

            child:

            Text(

              "${index+1}",

            ),

          ),


          title:

          Text(

            text,

            style:

            TextStyle(

              fontWeight:

              index==current

                  ?

              FontWeight.bold

                  :

              FontWeight.normal,

            ),

          ),


        );


      }).toList(),


    );


  }


}