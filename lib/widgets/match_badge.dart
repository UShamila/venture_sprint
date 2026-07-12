import 'package:flutter/material.dart';


class MatchBadge extends StatelessWidget {


  final double percentage;


  const MatchBadge({

    super.key,

    required this.percentage,

  });


  @override
  Widget build(BuildContext context){


    return Container(

      padding:
      const EdgeInsets.symmetric(
          horizontal:12,
          vertical:6
      ),


      decoration:

      BoxDecoration(

        color:
        Colors.green.shade100,

        borderRadius:
        BorderRadius.circular(20),

      ),


      child:

      Text(

        "${percentage.toInt()}% Match",

        style:

        const TextStyle(

          color:
          Colors.green,

          fontWeight:
          FontWeight.bold,

        ),

      ),


    );


  }

}