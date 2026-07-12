import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class MyInterviews extends StatelessWidget{


  const MyInterviews({super.key});



  @override
  Widget build(BuildContext context){


    final uid =
        FirebaseAuth.instance.currentUser!.uid;



    return Scaffold(

      appBar:
      AppBar(

        title:
        const Text(
          "My Interviews",
        ),

      ),



      body:

      StreamBuilder<QuerySnapshot>(


        stream:

        FirebaseFirestore.instance
            .collection("interviews")
            .where(
          "studentId",
          isEqualTo: uid,
        )
            .snapshots(),



        builder:(context,snapshot){


          if(!snapshot.hasData){

            return const Center(

              child:
              CircularProgressIndicator(),

            );

          }



          if(snapshot.data!.docs.isEmpty){

            return const Center(

              child:

              Text(
                "No interviews scheduled",
              ),

            );

          }




          return ListView(

            padding:
            const EdgeInsets.all(20),


            children:

            snapshot.data!.docs.map((doc){


              final data =
              doc.data()
              as Map<String,dynamic>;



              return Card(


                child:

                ListTile(

                  leading:
                  const Icon(
                    Icons.video_call,
                    color:
                    Colors.blue,
                  ),


                  title:

                  Text(

                    "${data["date"]} at ${data["time"]}",

                  ),


                  subtitle:

                  Text(

                    data["meetingLink"] ?? "",

                  ),


                ),

              );



            }).toList(),


          );



        },



      ),


    );


  }


}