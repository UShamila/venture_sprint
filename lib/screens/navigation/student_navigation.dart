import 'package:flutter/material.dart';

import '../student/student_dashboard.dart';
import '../student/opportunity_feed.dart';
import '../student/saved_opportunities.dart';
import '../student/my_applications.dart';
import '../student/student_profile.dart';



class StudentNavigation extends StatefulWidget {


  const StudentNavigation({super.key});


  @override
  State<StudentNavigation> createState()
  => _StudentNavigationState();


}



class _StudentNavigationState
    extends State<StudentNavigation>{



  int currentIndex = 0;



  final pages = [

    const StudentDashboard(),

    const OpportunityFeed(),

    const SavedOpportunities(),

    const MyApplications(),

    const StudentProfile(),

  ];



  @override
  Widget build(BuildContext context){


    return Scaffold(


      body:

      pages[currentIndex],



      bottomNavigationBar:


      NavigationBar(


        selectedIndex:
        currentIndex,



        onDestinationSelected:(index){


          setState((){


            currentIndex=index;


          });


        },



        destinations:[


          NavigationDestination(

            icon:
            Icon(Icons.home),

            label:
            "Home",

          ),


          NavigationDestination(

            icon:
            Icon(Icons.search),

            label:
            "Explore",

          ),


          NavigationDestination(

            icon:
            Icon(Icons.bookmark),

            label:
            "Saved",

          ),


          NavigationDestination(

            icon:
            Icon(Icons.assignment),

            label:
            "Applications",

          ),


          NavigationDestination(

            icon:
            Icon(Icons.person),

            label:
            "Profile",

          ),


        ],


      ),



    );



  }


}