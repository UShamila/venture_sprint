import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState()
  => _LoginScreenState();

}



class _LoginScreenState extends State<LoginScreen>{


  final emailController =
  TextEditingController();


  final passwordController =
  TextEditingController();


  bool obscurePassword = true;



  void showMessage(String message){

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
        content: Text(message),
      ),

    );

  }





  Future<void> login() async{


    final authProvider =
    Provider.of<AuthProvider>(
        context,
        listen:false
    );



    if(emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty){


      showMessage(
          "Please fill all fields"
      );

      return;

    }




    bool success =
    await authProvider.login(

      emailController.text.trim(),

      passwordController.text.trim(),

    );




    if(!success){

      showMessage(
          authProvider.error ??
              "Login failed"
      );

      return;

    }





    String? role =
    await authProvider.getRole();



    if(!mounted) return;




    if(role=="student"){


      Navigator.pushReplacementNamed(
          context,
          "/student"
      );


    }

    else if(role=="startup"){


      Navigator.pushReplacementNamed(
          context,
          "/startup"
      );


    }

    else{


      showMessage(
          "Role not found"
      );


    }


  }







  InputDecoration inputStyle(
      String label,
      IconData icon
      ){

    return InputDecoration(

      labelText: label,

      prefixIcon:
      Icon(icon),


      filled:true,


      fillColor:
      Colors.grey.shade100,


      border:
      OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(16),

        borderSide:
        BorderSide.none,

      ),


    );

  }








  @override
  Widget build(BuildContext context){


    final authProvider =
    Provider.of<AuthProvider>(
        context
    );



    return Scaffold(


      body:

      SafeArea(


        child:

        SingleChildScrollView(


          padding:
          const EdgeInsets.all(24),


          child:

          Column(

            children:[



              const SizedBox(height:40),





              Container(

                width:
                double.infinity,


                padding:
                const EdgeInsets.all(30),



                decoration:

                BoxDecoration(


                  gradient:
                  const LinearGradient(

                    colors:[

                      Colors.deepPurple,

                      Colors.purpleAccent,

                    ],

                  ),


                  borderRadius:
                  BorderRadius.circular(30),


                ),



                child:

                Column(

                  children:[



                    const Icon(

                      Icons.rocket_launch,

                      size:70,

                      color:
                      Colors.white,

                    ),



                    const SizedBox(height:15),




                    const Text(

                      "VentureSprint",

                      style:

                      TextStyle(

                        color:
                        Colors.white,

                        fontSize:32,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),




                    const SizedBox(height:8),




                    const Text(

                      "Connect students with ALU startups",

                      textAlign:
                      TextAlign.center,


                      style:

                      TextStyle(

                        color:
                        Colors.white70,

                      ),

                    ),



                  ],

                ),



              ),






              const SizedBox(height:40),





              Card(


                elevation:5,


                shape:

                RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(25),

                ),



                child:

                Padding(

                  padding:
                  const EdgeInsets.all(24),


                  child:

                  Column(

                    children:[



                      const Text(

                        "Welcome Back",

                        style:

                        TextStyle(

                          fontSize:28,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),



                      const SizedBox(height:10),




                      const Text(

                        "Login to continue",

                      ),




                      const SizedBox(height:30),





                      TextField(

                        controller:
                        emailController,


                        keyboardType:
                        TextInputType.emailAddress,


                        decoration:
                        inputStyle(

                            "Email",

                            Icons.email

                        ),

                      ),




                      const SizedBox(height:20),




                      TextField(


                        controller:
                        passwordController,



                        obscureText:
                        obscurePassword,



                        decoration:

                        inputStyle(

                            "Password",

                            Icons.lock

                        ).copyWith(


                          suffixIcon:

                          IconButton(

                            icon:

                            Icon(

                              obscurePassword

                                  ?

                              Icons.visibility

                                  :

                              Icons.visibility_off,

                            ),



                            onPressed:(){


                              setState(() {


                                obscurePassword =
                                !obscurePassword;


                              });


                            },


                          ),


                        ),



                      ),






                      Align(

                        alignment:
                        Alignment.centerRight,


                        child:

                        TextButton(

                          onPressed:(){


                            Navigator.pushNamed(

                                context,

                                "/forgot-password"

                            );


                          },


                          child:

                          const Text(
                              "Forgot Password?"
                          ),


                        ),

                      ),






                      const SizedBox(height:15),





                      SizedBox(


                        width:
                        double.infinity,



                        height:55,



                        child:

                        ElevatedButton(



                          style:

                          ElevatedButton.styleFrom(


                            backgroundColor:
                            Colors.deepPurple,


                            shape:

                            RoundedRectangleBorder(

                              borderRadius:
                              BorderRadius.circular(16),

                            ),

                          ),



                          onPressed:

                          authProvider.isLoading

                              ?

                          null

                              :

                          login,




                          child:

                          authProvider.isLoading

                              ?

                          const CircularProgressIndicator(

                            color:
                            Colors.white,

                          )


                              :

                          const Text(

                            "Login",

                            style:

                            TextStyle(

                              color:
                              Colors.white,

                              fontSize:18,

                            ),

                          ),



                        ),


                      ),






                      const SizedBox(height:20),




                      TextButton(

                        onPressed:(){


                          Navigator.pushNamed(

                              context,

                              "/register"

                          );


                        },


                        child:

                        const Text(

                            "Create new account"

                        ),

                      )



                    ],


                  ),


                ),


              ),



            ],


          ),


        ),


      ),


    );


  }


}