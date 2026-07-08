import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {


  const LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("Login"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 30),


            TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),


            const SizedBox(height: 20),


            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),


            const SizedBox(height: 30),


            ElevatedButton(

              onPressed: () {},

              child: const Text(
                "Login",
              ),

            )


          ],

        ),

      ),

    );

  }

}