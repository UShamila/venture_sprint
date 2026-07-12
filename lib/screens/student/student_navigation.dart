import 'package:flutter/material.dart';

import 'student_dashboard.dart';
import 'opportunity_feed.dart';
import 'saved_opportunities.dart';
import 'my_applications.dart';
import 'student_profile.dart';



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


          setState(() {


            currentIndex=index;


          });


        },



        destinations:[



          const NavigationDestination(

            icon:
            Icon(Icons.home_outlined),

            selectedIcon:
            Icon(Icons.home),

            label:"Home",

          ),




          const NavigationDestination(

            icon:
            Icon(Icons.search),

            label:"Explore",

          ),




          const NavigationDestination(

            icon:
            Icon(Icons.bookmark_outline),

            selectedIcon:
            Icon(Icons.bookmark),

            label:"Saved",

          ),





          const NavigationDestination(

            icon:
            Icon(Icons.assignment_outlined),

            selectedIcon:
            Icon(Icons.assignment),

            label:"Applications",

          ),





          const NavigationDestination(

            icon:
            Icon(Icons.person_outline),

            selectedIcon:
            Icon(Icons.person),

            label:"Profile",

          ),




        ],



      ),


    );


  }



}