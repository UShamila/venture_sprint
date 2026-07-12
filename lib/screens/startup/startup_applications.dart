import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../providers/application_provider.dart';
import 'schedule_interview.dart';



class StartupApplications extends StatelessWidget {


  const StartupApplications({
    super.key,
  });



  @override
  Widget build(BuildContext context){


    final startupId =
        FirebaseAuth.instance.currentUser!.uid;



    return Scaffold(


      appBar:

      AppBar(

        title:
        const Text(
          "Applicants",
        ),

      ),



      body:

      StreamBuilder(

        stream:

        Provider.of<ApplicationProvider>(
          context,
          listen:false,
        )
            .startupApplications(startupId),



        builder:(context,snapshot){



          if(!snapshot.hasData){

            return const Center(

              child:
              CircularProgressIndicator(),

            );

          }



          final applications =
          snapshot.data!;




          if(applications.isEmpty){

            return const Center(

              child:
              Text(
                "No applications yet",
              ),

            );

          }




          return ListView.builder(


            padding:
            const EdgeInsets.all(16),



            itemCount:
            applications.length,



            itemBuilder:(context,index){



              final application =
              applications[index];




              return Card(

                elevation:5,


                margin:
                const EdgeInsets.only(
                  bottom:15,
                ),



                child:

                Padding(

                  padding:
                  const EdgeInsets.all(16),



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
                            width:12,
                          ),



                          Expanded(

                            child:

                            Text(

                              application.studentName,

                              style:

                              const TextStyle(

                                fontSize:20,

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
                        height:8,
                      ),




                      Text(

                        "Opportunity: ${application.opportunityTitle}",

                      ),




                      const SizedBox(
                        height:8,
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

                              onPressed:

                              application.status=="pending"

                                  ?

                                  (){


                                Provider.of<ApplicationProvider>(
                                  context,
                                  listen:false,
                                )
                                    .updateStatus(

                                  application.id,

                                  "accepted",

                                  application.studentId,

                                );


                              }

                                  :

                              null,


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



                              onPressed:

                              application.status=="pending"

                                  ?

                                  (){


                                Provider.of<ApplicationProvider>(
                                  context,
                                  listen:false,
                                )
                                    .updateStatus(

                                  application.id,

                                  "rejected",

                                  application.studentId,

                                );


                              }

                                  :

                              null,


                              child:
                              const Text(
                                "Reject",
                              ),

                            ),

                          ),



                        ],

                      ),






                      const SizedBox(
                        height:15,
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


                          },


                        ),

                      ),



                    ],


                  ),

                ),

              );


            },

          );



        },

      ),


    );

  }



}