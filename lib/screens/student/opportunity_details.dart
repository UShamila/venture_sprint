import 'package:flutter/material.dart';
import '../../models/opportunity_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../providers/application_provider.dart';


class OpportunityDetails extends StatelessWidget {

  final OpportunityModel opportunity;


  const OpportunityDetails({
    super.key,
    required this.opportunity,
  });



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          opportunity.title,
        ),
      ),



      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,


          children: [


            Text(

              opportunity.title,

              style: const TextStyle(

                fontSize: 26,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 10),



            Text(

              opportunity.startupName,

              style: const TextStyle(

                fontSize: 18,

                color: Colors.grey,

              ),

            ),



            const SizedBox(height: 20),



            Text(
              opportunity.description,
            ),



            const SizedBox(height: 20),



            Text(
              "Category: ${opportunity.category}",
            ),



            Text(
              "Duration: ${opportunity.duration}",
            ),



            Text(
              "Location: ${opportunity.location}",
            ),



            const SizedBox(height: 20),



            const Text(

              "Required Skills",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 18,

              ),

            ),



            Wrap(

              spacing: 8,


              children:

              opportunity.skillsRequired

                  .map(

                    (skill) => Chip(

                  label: Text(skill),

                ),

              )

                  .toList(),

            ),



            const SizedBox(height: 40),



            SizedBox(

              width: double.infinity,


              child: ElevatedButton(


                onPressed: () async {


                  final user =
                      FirebaseAuth.instance.currentUser;



                  if (user == null) {


                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "Please login first",
                        ),

                      ),

                    );


                    return;

                  }



                  final provider =
                  Provider.of<ApplicationProvider>(

                    context,

                    listen: false,

                  );



                  // Check if student already applied

                  final alreadyApplied =

                  await provider.canApply(

                    opportunity.id,

                    user.uid,

                  );



                  if (alreadyApplied) {


                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(

                          "You already applied for this opportunity",

                        ),

                      ),

                    );


                    return;

                  }



                  // Submit application

                  await provider.apply(

                    opportunityId:
                    opportunity.id,


                    studentId:
                    user.uid,


                    startupId:
                    opportunity.startupId,


                    studentName:
                    user.displayName ?? "Student",


                    studentEmail:
                    user.email ?? "",


                    opportunityTitle:
                    opportunity.title,

                  );




                  ScaffoldMessenger.of(context)
                      .showSnackBar(

                    const SnackBar(

                      content: Text(

                        "Application submitted",

                      ),

                    ),

                  );


                },


                child: const Text(

                  "Apply Now",

                ),

              ),

            )

          ],

        ),

      ),

    );

  }

}