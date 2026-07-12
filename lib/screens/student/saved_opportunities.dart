import 'package:flutter/material.dart';


class SavedOpportunities extends StatelessWidget {


  const SavedOpportunities({super.key});


  @override
  Widget build(BuildContext context){


    return Scaffold(

      appBar:

      AppBar(

        title:
        const Text(
            "Saved Opportunities"
        ),

      ),


      body:

      const Center(

        child:

        Text(

            "Your saved opportunities will appear here"

        ),

      ),


    );


  }


}