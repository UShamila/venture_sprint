import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';


class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});


  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();

}



class _RegisterScreenState extends State<RegisterScreen> {


  final TextEditingController nameController =
  TextEditingController();


  final TextEditingController emailController =
  TextEditingController();


  final TextEditingController passwordController =
  TextEditingController();


  final TextEditingController confirmPasswordController =
  TextEditingController();



  String selectedRole = "student";



  @override
  Widget build(BuildContext context) {


    final authProvider =
    Provider.of<AuthProvider>(context);



    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "Create Account",
        ),

      ),



      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [



            const Text(

              "Join VentureSprint",

              style: TextStyle(

                fontSize:30,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:30),




            TextField(

              controller:nameController,

              decoration:
              const InputDecoration(

                labelText:"Full Name",

                prefixIcon:
                Icon(Icons.person),

              ),

            ),



            const SizedBox(height:20),




            TextField(

              controller:emailController,

              decoration:
              const InputDecoration(

                labelText:"Email",

                prefixIcon:
                Icon(Icons.email),

              ),

            ),



            const SizedBox(height:20),




            TextField(

              controller:passwordController,

              obscureText:true,

              decoration:
              const InputDecoration(

                labelText:"Password",

                prefixIcon:
                Icon(Icons.lock),

              ),

            ),



            const SizedBox(height:20),




            TextField(

              controller:
              confirmPasswordController,

              obscureText:true,

              decoration:
              const InputDecoration(

                labelText:
                "Confirm Password",

                prefixIcon:
                Icon(Icons.lock_outline),

              ),

            ),



            const SizedBox(height:30),




            const Align(

              alignment:Alignment.centerLeft,

              child:Text(

                "Select Account Type",

                style:TextStyle(

                  fontSize:18,

                  fontWeight:FontWeight.bold,

                ),

              ),

            ),




            RadioListTile(

              title:
              const Text("Student"),

              value:"student",

              groupValue:selectedRole,

              onChanged:(value){

                setState(() {

                  selectedRole=value!;

                });

              },

            ),



            RadioListTile(

              title:
              const Text("Startup"),

              value:"startup",

              groupValue:selectedRole,

              onChanged:(value){

                setState(() {

                  selectedRole=value!;

                });

              },

            ),





            const SizedBox(height:20),




            ElevatedButton(


              onPressed:
              authProvider.isLoading

                  ?

              null

                  :

                  () async {


                if(passwordController.text !=
                    confirmPasswordController.text){


                  ScaffoldMessenger.of(context)
                      .showSnackBar(

                    const SnackBar(

                      content:Text(
                        "Passwords do not match",
                      ),

                    ),

                  );


                  return;

                }




                await authProvider.register(


                  name:
                  nameController.text.trim(),


                  email:
                  emailController.text.trim(),


                  password:
                  passwordController.text.trim(),


                  role:selectedRole,


                );




                if(context.mounted){


                  bool success =
                  await authProvider.register(

                    name:nameController.text.trim(),

                    email:emailController.text.trim(),

                    password:passwordController.text.trim(),

                    role:selectedRole,

                  );



                  if(success){

                    Navigator.pushReplacementNamed(
                        context,
                        "/login"
                    );

                  }

                  else{

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      SnackBar(

                        content: Text(
                          authProvider.error ??
                              "Registration failed",
                        ),

                      ),

                    );

                  }


                }



              },


              child:

              authProvider.isLoading

                  ?

              const CircularProgressIndicator(
                color:Colors.white,
              )

                  :

              const Text(
                "Create Account",
              ),


            ),




            TextButton(

              onPressed:(){

                Navigator.pop(context);

              },


              child:
              const Text(
                "Already have an account? Login",
              ),

            )



          ],


        ),


      ),


    );


  }

}