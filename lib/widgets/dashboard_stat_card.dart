import 'package:flutter/material.dart';


class DashboardStatCard extends StatelessWidget{


  final String title;

  final String value;

  final IconData icon;


  const DashboardStatCard({

    super.key,

    required this.title,

    required this.value,

    required this.icon,

  });




  @override
  Widget build(BuildContext context){


    return Expanded(

      child:

      Container(

        padding:
        const EdgeInsets.all(18),


        margin:
        const EdgeInsets.only(right:10),



        decoration:

        BoxDecoration(

          color:
          Colors.white,


          borderRadius:
          BorderRadius.circular(20),


          boxShadow:[

            BoxShadow(

              blurRadius:10,

              color:
              Colors.black12,

            )

          ],

        ),



        child:

        Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children:[


            Icon(
              icon,
              color:
              Colors.deepPurple,
            ),


            const SizedBox(height:10),



            Text(

              value,

              style:

              const TextStyle(

                fontSize:24,

                fontWeight:
                FontWeight.bold,

              ),

            ),



            Text(title)

          ],

        ),

      ),

    );


  }


}