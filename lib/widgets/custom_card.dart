import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {


  final Widget child;


  const CustomCard({

    super.key,

    required this.child,

  });


  @override
  Widget build(BuildContext context){


    return Card(

      margin:
      const EdgeInsets.only(
          bottom:16
      ),


      child:

      Padding(

        padding:
        const EdgeInsets.all(18),


        child:child,

      ),

    );


  }

}