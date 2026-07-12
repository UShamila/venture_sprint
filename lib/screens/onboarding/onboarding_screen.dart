import 'package:flutter/material.dart';
import '../../services/startup_service.dart';

class OnboardingScreen extends StatefulWidget {

  const OnboardingScreen({super.key});


  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();

}



class _OnboardingScreenState extends State<OnboardingScreen> {


  final PageController _controller = PageController();


  int currentPage = 0;



  final List<Map<String, String>> pages = [


    {
      "title": "Welcome to VentureSprint",
      "description":
      "A platform connecting ALU students with student-led startups and meaningful internship opportunities.",
    },


    {
      "title": "Grow Your Career",
      "description":
      "Students can discover opportunities, showcase their skills, and gain real-world experience.",
    },


    {
      "title": "Build Your Startup Team",
      "description":
      "Startups can find talented ALU students and create opportunities for collaboration.",
    },


  ];




  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(

        child: Column(

          children: [


            Expanded(

              child: PageView.builder(

                controller: _controller,

                itemCount: pages.length,


                onPageChanged: (index){

                  setState(() {

                    currentPage = index;

                  });

                },


                itemBuilder: (context,index){


                  return Padding(

                    padding:
                    const EdgeInsets.all(30),


                    child: Column(

                      mainAxisAlignment:
                      MainAxisAlignment.center,


                      children: [


                        Icon(

                          Icons.rocket_launch,

                          size:120,

                          color:
                          Colors.deepPurple,

                        ),


                        const SizedBox(
                            height:40),



                        Text(

                          pages[index]["title"]!,

                          textAlign:
                          TextAlign.center,


                          style:
                          const TextStyle(

                            fontSize:30,

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),



                        const SizedBox(
                            height:20),



                        Text(

                          pages[index]["description"]!,

                          textAlign:
                          TextAlign.center,


                          style:
                          const TextStyle(

                            fontSize:17,

                            color:
                            Colors.grey,

                          ),

                        ),


                      ],

                    ),

                  );


                },

              ),

            ),



            // Page indicators

            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,


              children: List.generate(

                  pages.length,


                      (index){


                    return AnimatedContainer(

                      duration:
                      const Duration(
                          milliseconds:300),


                      margin:
                      const EdgeInsets.all(5),


                      width:
                      currentPage == index
                          ? 25
                          : 10,


                      height:10,


                      decoration:
                      BoxDecoration(

                        color:
                        Colors.deepPurple,


                        borderRadius:
                        BorderRadius.circular(10),

                      ),

                    );


                  }

              ),

            ),



            const SizedBox(height:30),




            Padding(

              padding:
              const EdgeInsets.symmetric(
                  horizontal:30),


              child: ElevatedButton(


                onPressed: () async {


                  if(currentPage ==
                      pages.length -1){


                    await StartupService()
                        .completeOnboarding();


                    Navigator.pushReplacementNamed(
                        context,
                        "/login"
                    );


                  }

                  else{


                    _controller.nextPage(

                      duration:
                      const Duration(
                          milliseconds:400),

                      curve:
                      Curves.ease,

                    );


                  }


                },


                child: Text(

                  currentPage ==
                      pages.length -1

                      ?
                  "Get Started"

                      :
                  "Next",

                ),


              ),

            ),


            const SizedBox(height:30),



          ],

        ),

      ),

    );

  }

}