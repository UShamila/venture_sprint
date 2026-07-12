import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../providers/application_provider.dart';
import '../../widgets/application_timeline.dart';



class MyApplications extends StatefulWidget {

  const MyApplications({
    super.key,
  });


  @override
  State<MyApplications> createState() =>
      _MyApplicationsState();

}





class _MyApplicationsState
    extends State<MyApplications> {



  @override
  void initState() {

    super.initState();


    Future.microtask(() {


      final user =
          FirebaseAuth.instance.currentUser;


      if (user == null) return;



      Provider.of<ApplicationProvider>(

        context,

        listen: false,

      )
          .loadStudentApplications(
          user.uid
      );



    });


  }






  Widget emptyState() {


    return Center(


      child: Column(


        mainAxisAlignment:
        MainAxisAlignment.center,



        children: [



          const Icon(

            Icons.assignment_outlined,

            size: 90,

            color: Colors.grey,

          ),




          const SizedBox(

            height: 20,

          ),





          const Text(


            "Nothing here yet",



            style:

            TextStyle(

              fontWeight:
              FontWeight.bold,

              fontSize:
              20,

            ),



          ),





          const SizedBox(

            height: 8,

          ),





          const Text(


            "Apply for opportunities and track your progress here.",



            textAlign:
            TextAlign.center,


          ),



        ],



      ),


    );


  }







  Icon statusIcon(String status) {


    switch(status.toLowerCase()){


      case "accepted":

        return const Icon(

          Icons.check_circle,

          color:
          Colors.green,

        );



      case "rejected":

        return const Icon(

          Icons.cancel,

          color:
          Colors.red,

        );



      default:

        return const Icon(

          Icons.pending,

        );


    }


  }









  @override
  Widget build(BuildContext context) {



    final provider =
    Provider.of<ApplicationProvider>(context);





    return Scaffold(



      appBar:

      AppBar(

        title:
        const Text(
          "My Applications",
        ),

      ),






      body:

      provider.applications.isEmpty



          ?



      emptyState()




          :



      ListView.builder(



        padding:
        const EdgeInsets.all(12),




        itemCount:
        provider.applications.length,




        itemBuilder:
            (context,index){



          final application =
          provider.applications[index];





          return Card(



            margin:
            const EdgeInsets.only(

              bottom: 16,

            ),



            elevation:
            3,



            shape:
            RoundedRectangleBorder(


              borderRadius:
              BorderRadius.circular(16),


            ),





            child:
            Padding(


              padding:
              const EdgeInsets.all(16),



              child:
              Column(


                crossAxisAlignment:
                CrossAxisAlignment.start,



                children: [





                  ListTile(



                    contentPadding:
                    EdgeInsets.zero,



                    title:
                    Text(


                      application.opportunityTitle,


                      style:
                      const TextStyle(


                        fontWeight:
                        FontWeight.bold,


                        fontSize:
                        16,


                      ),


                    ),





                    subtitle:
                    Text(


                      "Status: ${application.status}",



                    ),






                    trailing:

                    statusIcon(
                        application.status
                    ),



                  ),







                  const SizedBox(

                    height: 15,

                  ),








                  ApplicationTimeline(


                    status:
                    application.status,


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