import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/notification_provider.dart';



class NotificationScreen extends StatelessWidget {


  const NotificationScreen({super.key});



  @override
  Widget build(BuildContext context){


    final provider =
    Provider.of<NotificationProvider>(context);



    return Scaffold(

      appBar:

      AppBar(

        title:
        const Text(
            "Notifications"
        ),

      ),



      body:

      provider.notifications.isEmpty

          ?

      const Center(

        child:

        Text(
            "No notifications yet"
        ),

      )


          :

      ListView.builder(

        itemCount:
        provider.notifications.length,


        itemBuilder:(context,index){


          final notification =
          provider.notifications[index];


          return Card(

            child:

            ListTile(

              leading:

              const Icon(
                  Icons.notifications
              ),


              title:

              Text(
                  notification.title
              ),


              subtitle:

              Text(
                  notification.message
              ),


            ),

          );


        },


      ),


    );


  }

}