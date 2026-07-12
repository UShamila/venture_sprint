import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../providers/application_provider.dart';
import 'schedule_interview.dart';


class ApplicantsScreen extends StatefulWidget {

  const ApplicantsScreen({super.key});


  @override
  State<ApplicantsScreen> createState() =>
      _ApplicantsScreenState();

}



class _ApplicantsScreenState
    extends State<ApplicantsScreen> {



  @override
  void initState(){

    super.initState();


    Future.microtask(() {


      final user =
          FirebaseAuth.instance.currentUser;


      if(user == null) return;


      Provider.of<ApplicationProvider>(
        context,
        listen:false,
      ).loadStartupApplications(
        user.uid,
      );


    });


  }




  Future<void> updateStatus(
      ApplicationProvider provider,
      dynamic application,
      String status,
      ) async{


    await provider.updateStatus(

      application.id,

      status,

      application.studentId,

    );


  }





  void openScheduleInterview(dynamic application){


    Navigator.push(

      context,

      MaterialPageRoute(

        builder:(context)=>

            ScheduleInterview(

              studentId:
              application.studentId,


              applicationId:
              application.id,

            ),

      ),

    );


  }






  @override
  Widget build(BuildContext context){


    final provider =
    Provider.of<ApplicationProvider>(context);



    return Scaffold(


      appBar:

      AppBar(

        title:

        const Text(
          "Applicants",
        ),

      ),




      body:


      provider.loading


          ?


      const Center(

        child:

        CircularProgressIndicator(),

      )



          :



      provider.applications.isEmpty


          ?


      const Center(

        child:

        Text(
          "No applications yet",
        ),

      )



          :



      ListView.builder(


        padding:
        const EdgeInsets.all(15),


        itemCount:
        provider.applications.length,



        itemBuilder:(context,index){


          final application =
          provider.applications[index];



          return Card(


            elevation:4,


            margin:
            const EdgeInsets.only(
                bottom:15
            ),



            child:

            Padding(

              padding:
              const EdgeInsets.all(15),


              child:

              Column(


                crossAxisAlignment:
                CrossAxisAlignment.start,


                children:[



                  Row(

                    children:[


                      const CircleAvatar(

                        child:

                        Icon(
                          Icons.person,
                        ),

                      ),



                      const SizedBox(
                        width:15,
                      ),



                      Expanded(

                        child:

                        Text(

                          application.studentName,

                          style:

                          const TextStyle(

                            fontSize:18,

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),

                      ),


                    ],

                  ),




                  const SizedBox(
                    height:15,
                  ),




                  Text(

                    application.studentEmail,

                  ),




                  const SizedBox(
                    height:5,
                  ),




                  Text(

                    "Opportunity: ${application.opportunityTitle}",

                  ),




                  const SizedBox(
                    height:5,
                  ),




                  Text(

                    "Status: ${application.status}",

                    style:

                    const TextStyle(

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),





                  const SizedBox(
                    height:20,
                  ),




                  Row(

                    children:[



                      Expanded(

                        child:

                        ElevatedButton(

                          onPressed:() async{


                            await updateStatus(

                              provider,

                              application,

                              "accepted",

                            );


                          },


                          child:

                          const Text(
                            "Accept",
                          ),

                        ),

                      ),




                      const SizedBox(
                        width:10,
                      ),




                      Expanded(

                        child:

                        ElevatedButton(

                          style:

                          ElevatedButton.styleFrom(

                            backgroundColor:
                            Colors.red,

                          ),


                          onPressed:() async{


                            await updateStatus(

                              provider,

                              application,

                              "rejected",

                            );


                          },


                          child:

                          const Text(
                            "Reject",
                          ),

                        ),

                      ),


                    ],

                  ),





                  const SizedBox(
                    height:10,
                  ),




                  SizedBox(

                    width:
                    double.infinity,


                    child:

                    ElevatedButton.icon(

                      icon:

                      const Icon(
                        Icons.calendar_month,
                      ),



                      label:

                      const Text(
                        "Schedule Interview",
                      ),




                      onPressed:(){

                        openScheduleInterview(
                            application
                        );


                      },


                    ),

                  ),



                ],


              ),

            ),


          );


        },


      ),


    );


  }


}