import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/opportunity_provider.dart';
import '../../providers/student_provider.dart';
import '../../widgets/opportunity_card.dart';
import 'package:firebase_auth/firebase_auth.dart';


class OpportunityFeed extends StatefulWidget {

  const OpportunityFeed({super.key});

  @override
  State<OpportunityFeed> createState() =>
      _OpportunityFeedState();

}



class _OpportunityFeedState extends State<OpportunityFeed> {


  String search = "";

  String selectedCategory = "All";

  String selectedType = "All";



  final categories = [

    "All",
    "Software",
    "Design",
    "Marketing",
    "Business",
    "Research"

  ];



  final types = [

    "All",
    "Remote",
    "Hybrid",
    "On-site"

  ];





  @override
  void initState() {

    super.initState();


    Future.microtask(() {


      final studentProvider =
      Provider.of<StudentProvider>(
        context,
        listen: false,
      );


      final opportunityProvider =
      Provider.of<OpportunityProvider>(
        context,
        listen: false,
      );



      final user =
          FirebaseAuth.instance.currentUser;



      if(user != null){

        studentProvider.loadStudent(user.uid);

      }



      opportunityProvider.loadOpportunities();


    });


  }





  @override
  Widget build(BuildContext context){


    final opportunityProvider =
    Provider.of<OpportunityProvider>(context);



    final studentProvider =
    Provider.of<StudentProvider>(context);



    final skills =
        studentProvider.student?.skills ?? [];





    final opportunities =
        opportunityProvider.filteredOpportunities;



    final filteredOpportunities =
    opportunities.where((opportunity){



      final title =
      opportunity.title.toLowerCase();



      final category =
          opportunity.category;



      final type =
          opportunity.type;




      final matchesSearch =
      title.contains(search);



      final matchesCategory =
          selectedCategory == "All" ||
              category == selectedCategory;



      final matchesType =
          selectedType == "All" ||
              type == selectedType;




      return matchesSearch &&
          matchesCategory &&
          matchesType;



    }).toList();







    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "Opportunities",
        ),

      ),




      body: Padding(

        padding: const EdgeInsets.all(16),



        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,



          children:[



            const Text(

              "Find Opportunities",

              style: TextStyle(

                fontSize:28,

                fontWeight:
                FontWeight.bold,

              ),

            ),





            const SizedBox(height:8),





            const Text(

              "Discover internships from ALU startups",

              style: TextStyle(

                color: Colors.grey,

              ),

            ),





            const SizedBox(height:20),





            TextField(


              decoration: InputDecoration(

                hintText:
                "Search opportunities...",


                prefixIcon:
                const Icon(Icons.search),



                border:

                OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(15),

                ),

              ),



              onChanged:(value){


                setState((){

                  search =
                      value.toLowerCase();

                });


              },


            ),





            const SizedBox(height:15),






            Row(

              children:[



                Expanded(

                  child:
                  DropdownButtonFormField<String>(

                    value:
                    selectedCategory,


                    decoration:
                    const InputDecoration(

                      labelText:
                      "Category",

                    ),



                    items:

                    categories.map((category){

                      return DropdownMenuItem(

                        value: category,

                        child:
                        Text(category),

                      );

                    }).toList(),




                    onChanged:(value){


                      setState((){

                        selectedCategory =
                        value!;

                      });


                    },


                  ),

                ),




                const SizedBox(width:15),





                Expanded(

                  child:
                  DropdownButtonFormField<String>(

                    value:
                    selectedType,


                    decoration:
                    const InputDecoration(

                      labelText:
                      "Type",

                    ),



                    items:

                    types.map((type){

                      return DropdownMenuItem(

                        value:type,

                        child:
                        Text(type),

                      );

                    }).toList(),




                    onChanged:(value){


                      setState((){

                        selectedType =
                        value!;

                      });


                    },


                  ),

                ),


              ],

            ),





            const SizedBox(height:20),





            Expanded(


              child:


              opportunityProvider.loading



                  ?



              const Center(

                child:
                CircularProgressIndicator(),

              )




                  :



              filteredOpportunities.isEmpty




                  ?



              Center(

                child: Column(

                  mainAxisAlignment:
                  MainAxisAlignment.center,


                  children:[



                    const Icon(

                      Icons.work_outline,

                      size:80,

                      color:Colors.grey,

                    ),




                    const SizedBox(height:20),




                    const Text(

                      "No opportunities available",

                      style:

                      TextStyle(

                        fontSize:18,

                      ),

                    ),




                    const SizedBox(height:10),




                    const Text(

                      "New startup opportunities will appear here",

                    ),



                  ],

                ),

              )





                  :





              ListView.builder(


                itemCount:

                filteredOpportunities.length,



                itemBuilder:(context,index){



                  final opportunity =

                  filteredOpportunities[index];






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
                    skills,




                    onTap:(){



                      Navigator.pushNamed(

                        context,

                        "/opportunity-details",

                        arguments:
                        opportunity,

                      );



                    },


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