import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/notification_provider.dart';


class NotificationIcon extends StatelessWidget {


  const NotificationIcon({super.key});


  @override
  Widget build(BuildContext context){


    final provider =
    Provider.of<NotificationProvider>(context);



    return Stack(

      children:[


        IconButton(

          icon:

          const Icon(
              Icons.notifications
          ),

          onPressed:(){

            Navigator.pushNamed(
                context,
                "/notifications"
            );

          },

        ),



        if(provider.unreadCount > 0)

          Positioned(

            right:8,

            top:8,


            child:

            CircleAvatar(

              radius:8,

              child:

              Text(

                provider.unreadCount
                    .toString(),

                style:

                const TextStyle(

                    fontSize:10

                ),

              ),

            ),

          ),



      ],


    );


  }

}