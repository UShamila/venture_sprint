import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../providers/opportunity_provider.dart';



class CreateOpportunity extends StatefulWidget {

  const CreateOpportunity({super.key});


  @override
  State<CreateOpportunity> createState()
  => _CreateOpportunityState();

}



class _CreateOpportunityState
    extends State<CreateOpportunity>{


  final titleController =
  TextEditingController();


  final descriptionController =
  TextEditingController();


  final categoryController =
  TextEditingController();


  final skillsController =
  TextEditingController();


  final durationController =
  TextEditingController();


  final locationController =
  TextEditingController();



  final typeController =
  TextEditingController(
      text:"Internship"
  );




  Future<void> publishOpportunity() async{


    final provider =
    Provider.of<OpportunityProvider>(
        context,
        listen:false
    );



    final user =
        FirebaseAuth.instance.currentUser;



    await provider.addOpportunity({

      "startupId":
      user!.uid,


      "startupName":
      user.email,


      "title":
      titleController.text.trim(),


      "description":
      descriptionController.text.trim(),


      "category":
      categoryController.text.trim(),


      "skillsRequired":
      skillsController.text
          .split(","),


      "duration":
      durationController.text.trim(),


      "location":
      locationController.text.trim(),


      "type":
      typeController.text.trim(),


      "isActive":
      true,


      "createdAt":
      DateTime.now(),


    });



    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content:
        Text(
            "Opportunity published successfully"
        ),

      ),

    );



    Navigator.pop(context);


  }






  Widget buildField(
      String label,
      TextEditingController controller,
      {int lines=1}

      ){

    return Padding(

      padding:
      const EdgeInsets.only(bottom:15),


      child:TextField(

        controller:controller,

        maxLines:lines,


        decoration:
        InputDecoration(

          labelText:label,

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
            "Create Opportunity"
        ),

      ),



      body:

      SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),


        child:Column(

          children:[


            buildField(
                "Opportunity Title",
                titleController
            ),


            buildField(
                "Description",
                descriptionController,
                lines:4
            ),


            buildField(
                "Category",
                categoryController
            ),


            buildField(
                "Skills Required (comma separated)",
                skillsController
            ),


            buildField(
                "Duration",
                durationController
            ),


            buildField(
                "Location",
                locationController
            ),


            buildField(
                "Type",
                typeController
            ),



            const SizedBox(height:20),



            SizedBox(

              width:
              double.infinity,


              child:
              ElevatedButton(

                onPressed:
                publishOpportunity,


                child:
                const Text(
                    "Publish Opportunity"
                ),

              ),

            )


          ],

        ),

      ),


    );

  }

}