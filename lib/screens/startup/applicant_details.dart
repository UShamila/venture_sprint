import 'package:flutter/material.dart';


class ApplicantDetails extends StatelessWidget {

  const ApplicantDetails({
    super.key,
  });


  @override
  Widget build(BuildContext context) {


    // Receiving application data from previous screen
    final application =
    ModalRoute.of(context)!.settings.arguments
    as Map<String, dynamic>;



    return Scaffold(

      appBar: AppBar(

        title:
        const Text(
          "Applicant Details",
        ),

      ),



      body:

      SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),


        child:

        Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [



            Center(

              child:

              CircleAvatar(

                radius: 45,

                child:
                Text(

                  application["studentName"]
                      ?.substring(0,1)
                      .toUpperCase()
                      ??
                      "S",

                  style:
                  const TextStyle(

                    fontSize:30,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),

              ),

            ),




            const SizedBox(
              height:25,
            ),




            Text(

              application["studentName"]
                  ??
                  "Student",

              style:
              const TextStyle(

                fontSize:26,

                fontWeight:
                FontWeight.bold,

              ),

            ),




            const SizedBox(
              height:20,
            ),




            buildInfo(

              "Email",

              application["studentEmail"]
                  ??
                  "Not available",

            ),




            buildInfo(

              "Education Level",

              application["educationLevel"]
                  ??
                  "Not available",

            ),




            buildInfo(

              "Skills",

              (application["skills"] ?? [])
                  .toString(),

            ),




            buildInfo(

              "Bio",

              application["bio"]
                  ??
                  "No bio added",

            ),




            const SizedBox(
              height:30,
            ),




            Row(

              children: [



                Expanded(

                  child:

                  ElevatedButton(

                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.green,

                    ),


                    onPressed: () {


                      // Accept logic will be connected later


                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(

                          content:
                          Text(
                            "Application accepted",
                          ),

                        ),

                      );


                    },


                    child:
                    const Text(

                      "Accept",

                    ),


                  ),

                ),




                const SizedBox(
                  width:15,
                ),




                Expanded(

                  child:

                  ElevatedButton(

                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.red,

                    ),


                    onPressed: () {


                      // Reject logic will be connected later


                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(

                          content:
                          Text(
                            "Application rejected",
                          ),

                        ),

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
              height:20,
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




                onPressed: () {



                  Navigator.pushNamed(

                    context,

                    "/schedule-interview",

                    arguments:
                    application,

                  );


                },



              ),

            ),




          ],

        ),

      ),


    );

  }







  Widget buildInfo(
      String title,
      String value,
      ){

    return Padding(

      padding:
      const EdgeInsets.only(
        bottom:15,
      ),


      child:

      Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [


          Text(

            title,

            style:
            const TextStyle(

              fontWeight:
              FontWeight.bold,

              fontSize:16,

            ),

          ),



          const SizedBox(
            height:5,
          ),



          Text(

            value,

          ),



        ],

      ),

    );

  }


}