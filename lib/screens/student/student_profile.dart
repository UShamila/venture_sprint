import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../providers/student_provider.dart';
import '../../widgets/portfolio_card.dart';



class StudentProfile extends StatefulWidget {

  const StudentProfile({
    super.key,
  });


  @override
  State<StudentProfile> createState() =>
      _StudentProfileState();

}





class _StudentProfileState extends State<StudentProfile> {



  final githubController =
  TextEditingController();



  final linkedinController =
  TextEditingController();



  final bioController =
  TextEditingController();



  final educationController =
  TextEditingController();



  final fieldController =
  TextEditingController();



  final skillsController =
  TextEditingController();







  @override
  void initState() {

    super.initState();



    Future.microtask(() async {


      final user =
          FirebaseAuth.instance.currentUser;



      if(user == null) return;



      final provider =
      Provider.of<StudentProvider>(
        context,
        listen:false,
      );



      await provider.loadStudent(
        user.uid,
      );




      final student =
          provider.student;




      if(student != null){


        githubController.text =
            student.github;



        linkedinController.text =
            student.linkedin;



        bioController.text =
            student.bio;



        educationController.text =
            student.educationLevel;



        fieldController.text =
            student.fieldOfStudy;




        skillsController.text =
            student.skills.join(", ");

      }



    });


  }







  @override
  void dispose(){


    githubController.dispose();

    linkedinController.dispose();

    bioController.dispose();

    educationController.dispose();

    fieldController.dispose();

    skillsController.dispose();


    super.dispose();


  }









  Future<void> saveProfile() async {



    final user =
        FirebaseAuth.instance.currentUser;




    if(user == null) return;




    final uid =
        user.uid;





    await FirebaseFirestore.instance

        .collection("users")

        .doc(uid)

        .update({



      "bio":
      bioController.text.trim(),




      "educationLevel":
      educationController.text.trim(),




      "fieldOfStudy":
      fieldController.text.trim(),




      "github":
      githubController.text.trim(),




      "linkedin":
      linkedinController.text.trim(),




      "skills":

      skillsController.text

          .split(",")

          .map(
              (e)=>e.trim()
      )

          .where(
              (e)=>e.isNotEmpty
      )

          .toList(),



    });







    await Provider.of<StudentProvider>(

      context,

      listen:false,

    ).loadStudent(uid);







    ScaffoldMessenger.of(context)

        .showSnackBar(

      const SnackBar(

        content:

        Text(
          "Profile updated successfully",
        ),

      ),

    );



  }









  @override
  Widget build(BuildContext context) {



    final provider =
    Provider.of<StudentProvider>(
        context
    );





    final student =
        provider.student;






    return Scaffold(



      appBar: AppBar(



        title:

        const Text(
          "Student Profile",
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



          crossAxisAlignment:

          CrossAxisAlignment.center,



          children:[







            const CircleAvatar(



              radius:

              45,



              child:

              Icon(

                Icons.person,

                size:

                50,

              ),



            ),







            const SizedBox(
              height:25,
            ),







            Text(



              student?.name ?? "",




              style:

              const TextStyle(



                fontSize:

                24,



                fontWeight:

                FontWeight.bold,



              ),



            ),







            const SizedBox(
              height:20,
            ),







            TextField(



              controller:

              educationController,




              decoration:

              const InputDecoration(



                labelText:

                "Education Level",



              ),



            ),







            TextField(



              controller:

              fieldController,




              decoration:

              const InputDecoration(



                labelText:

                "Field of Study",



              ),



            ),







            TextField(



              controller:

              skillsController,




              decoration:

              const InputDecoration(



                labelText:

                "Skills (comma separated)",



              ),



            ),







            TextField(



              controller:

              bioController,




              maxLines:

              3,




              decoration:

              const InputDecoration(



                labelText:

                "Bio",



              ),



            ),







            TextField(



              controller:

              githubController,




              decoration:

              const InputDecoration(



                labelText:

                "Github Profile",



              ),



            ),







            TextField(



              controller:

              linkedinController,




              decoration:

              const InputDecoration(



                labelText:

                "LinkedIn Profile",



              ),



            ),







            const SizedBox(
              height:30,
            ),








            // PORTFOLIO SECTION

            if(student != null)

              PortfolioCard(

                projects:

                student.projects,

              ),








            const SizedBox(
              height:30,
            ),







            ElevatedButton(



              onPressed:

              saveProfile,




              child:

              const Text(

                "Save Profile",

              ),



            )





          ],



        ),



      ),



    );



  }



}