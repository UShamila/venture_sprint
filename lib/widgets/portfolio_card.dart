import 'package:flutter/material.dart';


class PortfolioCard extends StatelessWidget {


  final List projects;


  const PortfolioCard({

    super.key,

    required this.projects,

  });



  @override
  Widget build(BuildContext context){


    return Card(

      child:

      Padding(

        padding:
        const EdgeInsets.all(15),


        child:

        Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children:[


            const Text(

              "Projects",

              style:

              TextStyle(

                fontSize:20,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:10),



            ...projects.map(

                  (project)=>ListTile(

                leading:
                const Icon(Icons.code),


                title:
                Text(project["title"] ?? ""),


                subtitle:
                Text(project["description"] ?? ""),


              ),

            )



          ],


        ),

      ),


    );


  }


}