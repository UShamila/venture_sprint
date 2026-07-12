import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../providers/auth_provider.dart' as app_provider;
import '../../providers/notification_provider.dart';
import '../../providers/startup_dashboard_provider.dart';
import '../../providers/startup_analytics_provider.dart';
import '../../providers/theme_provider.dart';

import '../../services/user_service.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/dashboard_stat_card.dart';
import '../../widgets/dashboard_action_card.dart';
import '../../widgets/analytics_card.dart';


class StartupDashboard extends StatefulWidget {

  const StartupDashboard({super.key});

  @override
  State<StartupDashboard> createState() =>
      _StartupDashboardState();

}



class _StartupDashboardState extends State<StartupDashboard> {


  final UserService _userService = UserService();


  String startupName = "Startup";

  String verificationStatus = "pending";

  bool loading = true;



  @override
  void initState() {

    super.initState();

    loadVerification();


    WidgetsBinding.instance.addPostFrameCallback((_) {

      final user =
          FirebaseAuth.instance.currentUser;


      if(user == null) return;


      Provider.of<NotificationProvider>(
        context,
        listen:false,
      ).loadNotifications(
        user.uid,
      );


    });



    Future.microtask(() {

      Provider.of<StartupDashboardProvider>(
        context,
        listen:false,
      ).loadDashboard();


    });



    Future.microtask(() {

      final user =
          FirebaseAuth.instance.currentUser;


      if(user == null) return;


      Provider.of<StartupAnalyticsProvider>(
        context,
        listen:false,
      ).loadAnalytics(
        user.uid,
      );


    });


  }





  Future<void> loadVerification() async {


    final user =
        FirebaseAuth.instance.currentUser;


    if(user == null){

      setState(() {
        loading = false;
      });

      return;

    }



    final status =
    await _userService.getVerificationStatus(
      user.uid,
    );



    if(!mounted) return;


    setState(() {

      verificationStatus =
          status ?? "pending";

      loading = false;

    });


  }







  @override
  Widget build(BuildContext context) {


    if(loading){

      return const Scaffold(

        body: Center(

          child: CircularProgressIndicator(),

        ),

      );

    }




    final dashboard =
    Provider.of<StartupDashboardProvider>(
      context,
    );





    return Scaffold(


      appBar: AppBar(


        title: const Text(
          "Startup Dashboard",
        ),



        actions: [



          // Theme Toggle Button
          IconButton(

            icon: Icon(

              Theme.of(context).brightness ==
                  Brightness.dark

                  ? Icons.light_mode

                  : Icons.dark_mode,

            ),


            onPressed: (){

              Provider.of<ThemeProvider>(
                context,
                listen:false,
              ).toggleTheme();


            },

          ),





          // Logout Button
          IconButton(

            icon: const Icon(
              Icons.logout,
            ),


            onPressed: () async {


              await Provider.of<app_provider.AuthProvider>(
                context,
                listen:false,
              ).logout();



              Navigator.pushNamedAndRemoveUntil(

                context,

                "/login",

                    (route)=>false,

              );


            },


          ),


        ],


      ),







      body: SingleChildScrollView(


        padding: const EdgeInsets.all(20),



        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [





            Container(


              width: double.infinity,


              padding:
              const EdgeInsets.all(25),



              decoration: BoxDecoration(


                borderRadius:
                BorderRadius.circular(25),



                gradient:
                const LinearGradient(

                  colors:[

                    Color(0xff5B21B6),

                    Color(0xff7C3AED),

                  ],

                ),

              ),




              child: Column(


                crossAxisAlignment:
                CrossAxisAlignment.start,



                children: [


                  const Text(

                    "Welcome Back 👋",

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize:16,

                    ),

                  ),



                  const SizedBox(
                    height:10,
                  ),



                  Text(

                    startupName,

                    style: const TextStyle(

                      color:Colors.white,

                      fontSize:28,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),



                  const SizedBox(
                    height:12,
                  ),




                  Row(

                    children:[


                      Icon(

                        verificationStatus ==
                            "approved"

                            ? Icons.verified

                            : Icons.pending,

                        color:

                        verificationStatus ==
                            "approved"

                            ? Colors.greenAccent

                            : Colors.orangeAccent,

                      ),



                      const SizedBox(
                        width:8,
                      ),



                      Text(

                        verificationStatus ==
                            "approved"

                            ? "Verified Startup"

                            : "Verification Pending",

                        style:
                        const TextStyle(
                          color:Colors.white,
                        ),

                      ),


                    ],

                  )

                ],

              ),

            ),




            const SizedBox(height:30),




            const Text(

              "Startup Analytics",

              style:TextStyle(

                fontSize:22,

                fontWeight:
                FontWeight.bold,

              ),

            ),




            const SizedBox(height:15),




            Consumer<StartupAnalyticsProvider>(


              builder:(context,data,child){


                return Row(

                  children:[


                    Expanded(

                      child: AnalyticsCard(

                        title:"Opportunities",

                        value:
                        "${data.opportunities}",

                        icon:Icons.work,

                      ),

                    ),



                    const SizedBox(width:10),



                    Expanded(

                      child: AnalyticsCard(

                        title:"Applicants",

                        value:
                        "${data.applicants}",

                        icon:Icons.people,

                      ),

                    ),



                    const SizedBox(width:10),



                    Expanded(

                      child: AnalyticsCard(

                        title:"Accepted",

                        value:
                        "${data.accepted}",

                        icon:
                        Icons.check_circle,

                      ),

                    ),


                  ],

                );


              },

            ),






            const SizedBox(height:30),




            const Text(

              "Dashboard",

              style:TextStyle(

                fontSize:22,

                fontWeight:
                FontWeight.bold,

              ),

            ),




            const SizedBox(height:15),





            Row(

              children:[


                Expanded(

                  child: DashboardStatCard(

                    title:"Active",

                    value:
                    dashboard.active.toString(),

                    icon:Icons.work,

                  ),

                ),



                const SizedBox(width:10),



                Expanded(

                  child: DashboardStatCard(

                    title:"Applicants",

                    value:
                    dashboard.applicants.toString(),

                    icon:Icons.people,

                  ),

                ),


              ],

            ),





            const SizedBox(height:12),





            Row(

              children:[


                Expanded(

                  child: DashboardStatCard(

                    title:"Accepted",

                    value:
                    dashboard.accepted.toString(),

                    icon:
                    Icons.check_circle,

                  ),

                ),




                const SizedBox(width:10),



                Expanded(

                  child: DashboardStatCard(

                    title:"Pending",

                    value:
                    dashboard.pending.toString(),

                    icon:
                    Icons.schedule,

                  ),

                ),


              ],

            ),





            const SizedBox(height:30),




            const Text(

              "Quick Actions",

              style:TextStyle(

                fontSize:22,

                fontWeight:
                FontWeight.bold,

              ),

            ),




            const SizedBox(height:15),




            DashboardActionCard(

              icon:Icons.add_circle,

              title:"Create Opportunity",

              subtitle:"Post a new internship",

              onTap:(){

                Navigator.pushNamed(
                  context,
                  "/create-opportunity",
                );

              },

            ),




            DashboardActionCard(

              icon:Icons.people,

              title:"Applicants",

              subtitle:"Review student applications",

              onTap:(){

                Navigator.pushNamed(
                  context,
                  "/applicants",
                );

              },

            ),




            DashboardActionCard(

              icon:Icons.business,

              title:"Startup Profile",

              subtitle:"Edit company profile",

              onTap:(){

                Navigator.pushNamed(
                  context,
                  "/startup-profile",
                );

              },

            ),




            DashboardActionCard(

              icon:Icons.analytics,

              title:"Analytics",

              subtitle:"View hiring insights",

              onTap:(){

                Navigator.pushNamed(
                  context,
                  "/startup-analytics",
                );

              },

            ),





            const SizedBox(height:25),




            const Text(

              "Recent Opportunities",

              style:TextStyle(

                fontSize:22,

                fontWeight:
                FontWeight.bold,

              ),

            ),





            const SizedBox(height:10),





            Card(

              child: ListTile(

                leading:
                const Icon(
                  Icons.work_outline,
                ),


                title:
                const Text(
                  "Your published opportunities",
                ),


                subtitle:
                const Text(
                  "These will be loaded from Firestore.",
                ),

              ),

            ),



          ],

        ),


      ),


    );

  }

}