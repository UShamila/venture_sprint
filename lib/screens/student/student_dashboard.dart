import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../providers/student_provider.dart';
import '../../providers/auth_provider.dart' as app;
import '../../providers/bookmark_provider.dart';
import '../../providers/notification_provider.dart';
import '../../providers/opportunity_provider.dart';
import '../../providers/theme_provider.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/section_title.dart';
import '../../widgets/notification_icon.dart';
import '../../widgets/dashboard_stat_card.dart';
import '../../widgets/opportunity_card.dart';

import '../../services/notification_service.dart';


class StudentDashboard extends StatefulWidget {

  const StudentDashboard({super.key});


  @override
  State<StudentDashboard> createState() =>
      _StudentDashboardState();

}



class _StudentDashboardState extends State<StudentDashboard> {


  @override
  void initState() {

    super.initState();


    Future.microtask(() async {


      final user =
          FirebaseAuth.instance.currentUser;


      if (user == null) return;


      final uid = user.uid;


      Provider.of<StudentProvider>(
        context,
        listen: false,
      ).loadStudent(uid);



      Provider.of<BookmarkProvider>(
        context,
        listen: false,
      ).loadBookmarks(uid);



      Provider.of<NotificationProvider>(
        context,
        listen: false,
      ).loadNotifications(uid);



      await NotificationService().createNotification(

        userId: uid,

        title: "Welcome to VentureSprint",

        message: "Your account is ready",

        type: "system",

      );


    });


  }



  Widget emptyState({

    required IconData icon,

    required String title,

    required String subtitle,

  }) {


    return Center(

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [


          Icon(

            icon,

            size: 90,

            color: Colors.grey,

          ),


          const SizedBox(height:20),


          Text(

            title,

            style: const TextStyle(

              fontWeight: FontWeight.bold,

              fontSize:20,

            ),

          ),


          const SizedBox(height:8),


          Text(

            subtitle,

            textAlign: TextAlign.center,

          ),


        ],

      ),

    );


  }





  @override
  Widget build(BuildContext context) {


    final studentProvider =
    Provider.of<StudentProvider>(context);



    final opportunityProvider =
    Provider.of<OpportunityProvider>(context);




    return Scaffold(


      appBar: AppBar(


        title: const Text(
          "Student Dashboard",
        ),



        actions: [



          const NotificationIcon(),



          // DARK / LIGHT MODE TOGGLE
          IconButton(

            icon: Icon(

              Theme.of(context).brightness ==
                  Brightness.dark

                  ? Icons.light_mode

                  : Icons.dark_mode,

            ),


            onPressed: () {


              Provider.of<ThemeProvider>(

                context,

                listen:false,

              ).toggleTheme();


            },

          ),




          // LOGOUT
          IconButton(

            icon: const Icon(
              Icons.logout,
            ),


            onPressed: () async {


              await Provider.of<app.AuthProvider>(

                context,

                listen:false,

              ).logout();



              Navigator.pushNamedAndRemoveUntil(

                context,

                "/",

                    (route) => false,

              );


            },

          ),


        ],


      ),





      body: studentProvider.loading


          ? ListView.builder(

        itemCount:4,

        itemBuilder:(context,index){

          return Card(

            margin:
            const EdgeInsets.all(10),

            child: Container(

              height:120,

              padding:
              const EdgeInsets.all(20),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [


                  Container(

                    width:180,

                    height:18,

                    color:
                    Colors.grey.shade300,

                  ),



                  const SizedBox(height:15),



                  Container(

                    width:
                    double.infinity,

                    height:14,

                    color:
                    Colors.grey.shade200,

                  ),



                  const SizedBox(height:10),



                  Container(

                    width:150,

                    height:14,

                    color:
                    Colors.grey.shade200,

                  ),


                ],

              ),

            ),

          );


        },

      )



          : SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),


        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [



            Container(

              padding:
              const EdgeInsets.all(25),


              decoration:
              BoxDecoration(

                gradient:
                const LinearGradient(

                  colors:[

                    Color(0xFF2563EB),

                    Color(0xFF60A5FA),

                  ],

                ),

                borderRadius:
                BorderRadius.circular(25),

              ),



              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,


                children:[


                  const Text(

                    "Welcome back 👋",

                    style:
                    TextStyle(

                      color:Colors.white,

                      fontSize:16,

                    ),

                  ),



                  const SizedBox(height:10),



                  Text(

                    studentProvider.student?.name ??
                        "Student",

                    style:
                    const TextStyle(

                      color:Colors.white,

                      fontSize:26,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),



                  const SizedBox(height:8),



                  const Text(

                    "Find internships and grow your career",

                    style:
                    TextStyle(

                      color:Colors.white,

                      fontSize:15,

                    ),

                  ),


                ],


              ),


            ),




            const SizedBox(height:25),



            Container(

              padding:
              const EdgeInsets.all(20),


              decoration:
              BoxDecoration(

                color:
                Theme.of(context)
                    .cardColor,


                borderRadius:
                BorderRadius.circular(20),


              ),


              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,


                children:[


                  const Text(

                    "Profile Completion",

                    style:
                    TextStyle(

                      fontWeight:
                      FontWeight.bold,

                      fontSize:18,

                    ),

                  ),



                  const SizedBox(height:15),



                  LinearProgressIndicator(

                    value:
                    studentProvider.profileCompletion,

                    minHeight:10,

                    borderRadius:
                    BorderRadius.circular(10),

                  ),



                  const SizedBox(height:10),



                  Text(

                    "${(studentProvider.profileCompletion * 100).toInt()}% Complete",

                  ),


                ],

              ),


            ),




            const SizedBox(height:30),




            Row(

              children:[


                Expanded(

                  child:
                  DashboardStatCard(

                    title:"Applications",

                    value:"0",

                    icon:
                    Icons.assignment,

                  ),

                ),



                const SizedBox(width:10),



                Expanded(

                  child:
                  DashboardStatCard(

                    title:"Saved",

                    value:"0",

                    icon:
                    Icons.bookmark,

                  ),

                ),



                const SizedBox(width:10),



                Expanded(

                  child:
                  DashboardStatCard(

                    title:"Matches",

                    value:"0",

                    icon:
                    Icons.star,

                  ),

                ),


              ],

            ),




            const SizedBox(height:30),



            const SectionTitle(

              title:"Recommended For You",

            ),




            const SizedBox(height:15),




            opportunityProvider.recommend(

              studentProvider.student?.skills ?? [],

            ).isEmpty



                ? SizedBox(

              height:250,

              child:emptyState(

                icon:
                Icons.work_outline,

                title:
                "Nothing here yet",

                subtitle:
                "Check back later for new opportunities.",

              ),

            )



                : Column(

              children:

              opportunityProvider.recommend(

                studentProvider.student?.skills ?? [],

              ).take(3).map((opportunity){


                return OpportunityCard(

                  opportunityId:
                  opportunity.id,

                  title:
                  opportunity.title,

                  startupName:
                  opportunity.startupName,

                  description:
                  opportunity.description,

                  location:
                  opportunity.location,

                  duration:
                  opportunity.duration,

                  skills:
                  opportunity.skillsRequired,

                  studentSkills:
                  studentProvider.student?.skills ?? [],


                  onTap:(){


                    Navigator.pushNamed(

                      context,

                      "/opportunity-details",

                      arguments:
                      opportunity.id,

                    );


                  },


                );


              }).toList(),


            ),





            const SizedBox(height:30),



            const SectionTitle(

              title:"Quick Actions",

            ),




            CustomCard(

              child:
              ListTile(

                leading:
                const Icon(Icons.person),


                title:
                const Text("My Profile"),


                subtitle:
                const Text(
                  "Update your skills and information",
                ),


                onTap:(){

                  Navigator.pushNamed(
                    context,
                    "/student-profile",
                  );


                },


              ),

            ),





            CustomCard(

              child:
              ListTile(

                leading:
                const Icon(Icons.search),


                title:
                const Text(
                  "Find Opportunities",
                ),


                subtitle:
                const Text(
                  "Discover internships from ALU startups",
                ),


                onTap:(){

                  Navigator.pushNamed(
                    context,
                    "/opportunities",
                  );


                },


              ),

            ),




            CustomCard(

              child:
              ListTile(

                leading:
                const Icon(Icons.assignment),


                title:
                const Text(
                  "My Applications",
                ),


                subtitle:
                const Text(
                  "Track application progress",
                ),


                onTap:(){

                  Navigator.pushNamed(
                    context,
                    "/my-applications",
                  );


                },


              ),

            ),





            CustomCard(

              child:
              ListTile(

                leading:
                const Icon(Icons.bookmark),


                title:
                const Text(
                  "Saved Opportunities",
                ),


                subtitle:
                const Text(
                  "View opportunities you saved",
                ),


                onTap:(){

                  Navigator.pushNamed(
                    context,
                    "/saved-opportunities",
                  );


                },


              ),

            ),





            CustomCard(

              child:
              ListTile(

                leading:
                const Icon(

                  Icons.calendar_month,

                  color:Colors.blue,

                ),


                title:
                const Text(
                  "My Interviews",
                ),


                subtitle:
                const Text(
                  "View upcoming interviews",
                ),


                onTap:(){

                  Navigator.pushNamed(

                    context,

                    "/student-interviews",

                  );


                },


              ),

            ),




          ],

        ),

      ),

    );


  }


}