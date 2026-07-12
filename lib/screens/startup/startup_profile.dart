import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../providers/startup_provider.dart';
import '../../widgets/verification_badge.dart';



class StartupProfile extends StatefulWidget {

  const StartupProfile({
    super.key,
  });


  @override
  State<StartupProfile> createState() =>
      _StartupProfileState();

}





class _StartupProfileState extends State<StartupProfile> {



  final startupNameController =
  TextEditingController();


  final descriptionController =
  TextEditingController();


  final industryController =
  TextEditingController();


  final locationController =
  TextEditingController();


  final websiteController =
  TextEditingController();


  final contactController =
  TextEditingController();






  @override
  void initState() {

    super.initState();



    Future.microtask(() async {


      final user =
          FirebaseAuth.instance.currentUser;



      if(user == null) return;




      final provider =
      Provider.of<StartupProvider>(

        context,

        listen:false,

      );




      await provider.loadStartup(

        user.uid,

      );




      final startup =
          provider.startup;




      if(startup != null){


        startupNameController.text =
            startup.startupName;


        descriptionController.text =
            startup.description;


        industryController.text =
            startup.industry;


        locationController.text =
            startup.location;


        websiteController.text =
            startup.website;


        contactController.text =
            startup.contactEmail;


      }



    });


  }








  Future<void> saveProfile() async {



    final user =
        FirebaseAuth.instance.currentUser;



    if(user == null) return;





    final provider =
    Provider.of<StartupProvider>(

      context,

      listen:false,

    );





    await provider.updateProfile(


      user.uid,



      {


        "startupName":
        startupNameController.text.trim(),



        "description":
        descriptionController.text.trim(),



        "industry":
        industryController.text.trim(),



        "location":
        locationController.text.trim(),



        "website":
        websiteController.text.trim(),



        "contactEmail":
        contactController.text.trim(),



        "verificationStatus":
        "pending",



      },


    );





    ScaffoldMessenger.of(context)
        .showSnackBar(


      const SnackBar(


        content:
        Text(
          "Verification request submitted",
        ),


      ),


    );


  }









  @override
  void dispose(){


    startupNameController.dispose();

    descriptionController.dispose();

    industryController.dispose();

    locationController.dispose();

    websiteController.dispose();

    contactController.dispose();



    super.dispose();


  }









  @override
  Widget build(BuildContext context) {



    final provider =
    Provider.of<StartupProvider>(context);





    final startup =
        provider.startup;





    return Scaffold(



      appBar: AppBar(


        title:
        const Text(
          "Startup Profile",
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



      SingleChildScrollView(



        padding:
        const EdgeInsets.all(20),




        child:
        Column(



          children:[







            const CircleAvatar(


              radius:45,



              child:
              Icon(

                Icons.business,

                size:50,

              ),



            ),






            const SizedBox(
              height:20,
            ),









            // STARTUP NAME + VERIFICATION BADGE

            if(startup != null)



              Row(



                mainAxisAlignment:
                MainAxisAlignment.center,



                children:[



                  Text(


                    startup.startupName,



                    style:
                    const TextStyle(


                      fontSize:26,


                      fontWeight:
                      FontWeight.bold,


                    ),


                  ),





                  const SizedBox(

                    width:10,

                  ),





                  VerificationBadge(
                    verified: startup.isVerified,
                  )

                ],

              ),






            const SizedBox(
              height:20,
            ),






            Text(



              "Verification Status: ${startup?.verificationStatus ?? "pending"}",




              style:
              const TextStyle(



                fontWeight:
                FontWeight.bold,



              ),



            ),






            const SizedBox(
              height:20,
            ),







            TextField(


              controller:
              startupNameController,



              decoration:
              const InputDecoration(


                labelText:
                "Startup Name",


              ),



            ),








            TextField(


              controller:
              industryController,



              decoration:
              const InputDecoration(


                labelText:
                "Industry",


              ),



            ),








            TextField(


              controller:
              descriptionController,



              maxLines:
              4,



              decoration:
              const InputDecoration(


                labelText:
                "Startup Description",


              ),



            ),








            TextField(


              controller:
              locationController,



              decoration:
              const InputDecoration(


                labelText:
                "Location",


              ),



            ),








            TextField(


              controller:
              websiteController,



              decoration:
              const InputDecoration(


                labelText:
                "Website",


              ),



            ),








            TextField(


              controller:
              contactController,



              decoration:
              const InputDecoration(


                labelText:
                "Contact Email",


              ),



            ),







            const SizedBox(
              height:30,
            ),







            ElevatedButton(


              onPressed:
              saveProfile,



              child:
              const Text(

                "Submit Verification",

              ),



            )





          ],



        ),



      ),



    );



  }



}