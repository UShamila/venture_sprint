import 'package:flutter/material.dart';
import 'match_badge.dart';
import '../services/matching_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/bookmark_provider.dart';

class OpportunityCard extends StatelessWidget {

  final String opportunityId;
  final String title;
  final String startupName;
  final String description;
  final String location;
  final String duration;
  final List skills;
  final VoidCallback onTap;
  final List studentSkills;


  const OpportunityCard({

    super.key,

    required this.opportunityId,

    required this.title,

    required this.startupName,

    required this.description,

    required this.location,

    required this.duration,

    required this.skills,

    required this.onTap,

    required this.studentSkills,

  });



  @override
  Widget build(BuildContext context) {


    final match =
    MatchingService()
        .calculateMatch(
      studentSkills,
      skills,
    );


    final bookmarkProvider =
    Provider.of<BookmarkProvider>(context);



    final isBookmarked =
    bookmarkProvider.isBookmarked(opportunityId);



    return Card(

      margin:
      const EdgeInsets.only(bottom:18),


      child:

      Padding(

        padding:
        const EdgeInsets.all(18),


        child:

        Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children:[


            Row(

              children:[


                Container(

                  padding:
                  const EdgeInsets.all(12),


                  decoration:

                  BoxDecoration(

                    color:
                    Colors.blue.shade50,

                    borderRadius:
                    BorderRadius.circular(15),

                  ),


                  child:

                  const Icon(

                    Icons.business,

                    color:
                    Colors.blue,

                  ),

                ),



                const SizedBox(width:12),



                Expanded(

                  child:

                  Text(

                    title,

                    style:

                    const TextStyle(

                      fontSize:18,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                ),



                IconButton(

                  icon:

                  Icon(

                    isBookmarked

                        ?

                    Icons.bookmark

                        :

                    Icons.bookmark_border,


                    color:

                    Colors.blue,

                  ),


                  onPressed:() async{


                    final user =
                        FirebaseAuth.instance.currentUser;



                    if(user == null){

                      return;

                    }



                    await Provider.of<BookmarkProvider>(

                      context,

                      listen:false,

                    )

                        .toggleBookmark(

                      user.uid,

                      opportunityId,

                    );


                  },


                ),


              ],

            ),




            const SizedBox(height:15),




            Text(

              startupName,

              style:

              TextStyle(

                color:
                Colors.grey.shade700,

                fontWeight:
                FontWeight.w600,

              ),

            ),




            const SizedBox(height:10),




            Text(

              description,

              maxLines:3,

              overflow:
              TextOverflow.ellipsis,

            ),




            const SizedBox(height:15),




            Row(

              children:[


                const Icon(

                  Icons.location_on,

                  size:18,

                ),


                const SizedBox(width:5),


                Text(location),



                const SizedBox(width:20),



                const Icon(

                  Icons.schedule,

                  size:18,

                ),


                const SizedBox(width:5),


                Text(duration),



              ],

            ),





            const SizedBox(height:15),




            Wrap(

              spacing:8,

              children:

              skills.map((skill){


                return Chip(

                  label:

                  Text(skill),

                );


              }).toList(),

            ),




            const SizedBox(height:15),



            Align(

              alignment:
              Alignment.centerRight,


              child:

              MatchBadge(

                percentage:

                match,

              ),

            ),




            const SizedBox(height:15),




            SizedBox(

              width:
              double.infinity,


              child:

              ElevatedButton(

                onPressed:onTap,


                child:

                const Text(

                  "View Opportunity",

                ),

              ),

            ),



          ],


        ),


      ),


    );


  }


}