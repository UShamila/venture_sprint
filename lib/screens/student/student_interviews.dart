import 'package:flutter/material.dart';


class StudentInterviews extends StatelessWidget {


  const StudentInterviews({
    super.key
  });


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:
      AppBar(
        title:
        const Text(
          "My Interviews",
        ),
      ),


      body:

      ListView(

        padding:
        const EdgeInsets.all(20),


        children:[


          Card(

            child:
            ListTile(

              leading:
              const Icon(
                Icons.video_call,
                color:Colors.green,
              ),


              title:
              const Text(
                "Flutter Developer Interview",
              ),


              subtitle:
              const Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children:[

                  Text(
                    "12 July 2026",
                  ),

                  Text(
                    "10:00 AM",
                  ),

                  Text(
                    "Google Meet",
                  ),

                ],

              ),

              trailing:
              IconButton(

                icon:
                const Icon(
                  Icons.link,
                ),

                onPressed:(){

                },

              ),


            ),

          ),



        ],

      ),


    );


  }


}