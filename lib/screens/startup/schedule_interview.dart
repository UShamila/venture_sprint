import 'package:flutter/material.dart';
import '../../services/interview_service.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ScheduleInterview extends StatefulWidget{


  final String studentId;

  final String applicationId;



  const ScheduleInterview({

    super.key,

    required this.studentId,

    required this.applicationId,

  });



  @override
  State<ScheduleInterview> createState()
  => _ScheduleInterviewState();

}



class _ScheduleInterviewState
    extends State<ScheduleInterview>{



  final service =
  InterviewService();



  final date =
  TextEditingController();


  final time =
  TextEditingController();


  final link =
  TextEditingController();


  final notes =
  TextEditingController();




  Future<void> save() async {

    final startupId =
        FirebaseAuth.instance.currentUser!.uid;


    await service.scheduleInterview(

      studentId:
      widget.studentId,

      startupId:
      FirebaseAuth.instance.currentUser!.uid,

      applicationId:
      widget.applicationId,

      date:
      date.text.trim(),

      time:
      time.text.trim(),

      meetingLink:
      link.text.trim(),

      notes:
      notes.text.trim(),

    );


    Navigator.pop(context);

  }





  Widget field(
      String title,
      TextEditingController controller
      ){

    return Padding(

      padding:
      const EdgeInsets.only(bottom:15),

      child:

      TextField(

        controller:
        controller,

        decoration:

        InputDecoration(

          labelText:title,

          border:
          const OutlineInputBorder(),

        ),

      ),

    );


  }



  @override
  Widget build(BuildContext context){


    return Scaffold(

      appBar:
      AppBar(

        title:
        const Text(
          "Schedule Interview",
        ),

      ),


      body:

      Padding(

        padding:
        const EdgeInsets.all(20),


        child:

        Column(

          children:[


            field(
              "Interview Date",
              date,
            ),


            field(
              "Interview Time",
              time,
            ),


            field(
              "Meeting Link",
              link,
            ),


            field(
              "Notes",
              notes,
            ),



            ElevatedButton(

              onPressed:
              save,


              child:
              const Text(
                "Schedule",
              ),

            )


          ],

        ),

      ),


    );


  }


}