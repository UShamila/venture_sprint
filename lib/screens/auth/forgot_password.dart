import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';


class ForgotPasswordScreen extends StatefulWidget {

  const ForgotPasswordScreen({super.key});


  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();

}



class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen>{


  final emailController =
  TextEditingController();



  @override
  Widget build(BuildContext context){


    return Scaffold(

      appBar: AppBar(
        title:
        const Text("Reset Password"),
      ),


      body: Padding(

        padding:
        const EdgeInsets.all(20),


        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,


          children: [


            TextField(

              controller:
              emailController,


              decoration:
              const InputDecoration(

                labelText:"Email",

              ),

            ),


            const SizedBox(height:20),


            ElevatedButton(

              onPressed:() async{


                await Provider.of<AuthProvider>(
                    context,
                    listen:false
                ).resetPassword(

                    emailController.text.trim()

                );


                ScaffoldMessenger.of(context)
                    .showSnackBar(

                  const SnackBar(

                    content:
                    Text(
                      "Password reset email sent",
                    ),

                  ),

                );


              },


              child:
              const Text(
                  "Send Reset Email"
              ),

            )

          ],

        ),

      ),

    );

  }

}