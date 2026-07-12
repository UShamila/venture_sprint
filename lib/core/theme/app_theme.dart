import 'package:flutter/material.dart';


class AppTheme {


  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,


    colorScheme: ColorScheme.fromSeed(

      seedColor: const Color(0xFF2563EB),

      brightness: Brightness.light,

    ),


    scaffoldBackgroundColor:
    const Color(0xFFF8FAFC),



    appBarTheme: const AppBarTheme(

      backgroundColor: Colors.transparent,

      foregroundColor: Colors.black,

      elevation: 0,

      centerTitle: false,

    ),



    cardTheme: CardThemeData(

      elevation: 0,

      color: Colors.white,


      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20),

      ),

    ),



    textTheme: const TextTheme(


      headlineLarge: TextStyle(

        fontSize: 32,

        fontWeight: FontWeight.bold,

      ),



      headlineMedium: TextStyle(

        fontSize: 26,

        fontWeight: FontWeight.bold,

      ),



      titleLarge: TextStyle(

        fontSize: 20,

        fontWeight: FontWeight.w600,

      ),



      bodyLarge: TextStyle(

        fontSize: 16,

      ),


    ),



    elevatedButtonTheme: ElevatedButtonThemeData(


      style: ElevatedButton.styleFrom(


        backgroundColor:
        const Color(0xFF2563EB),


        foregroundColor:
        Colors.white,


        minimumSize: const Size(

          double.infinity,

          55,

        ),



        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(16),

        ),



        textStyle: const TextStyle(

          fontSize: 16,

          fontWeight: FontWeight.bold,

        ),

      ),

    ),



    inputDecorationTheme: InputDecorationTheme(


      filled: true,


      fillColor: Colors.white,


      border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(16),

        borderSide: BorderSide.none,

      ),



      enabledBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(16),

        borderSide: BorderSide.none,

      ),



      focusedBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(16),


        borderSide: const BorderSide(

          color: Color(0xFF2563EB),

          width: 2,

        ),

      ),



      contentPadding: const EdgeInsets.symmetric(

        horizontal: 20,

        vertical: 18,

      ),

    ),



    bottomNavigationBarTheme:
    const BottomNavigationBarThemeData(


      selectedItemColor:
      Color(0xFF2563EB),


      unselectedItemColor:
      Colors.grey,


    ),


  );





  // DARK THEME

  static ThemeData darkTheme = ThemeData(


    brightness: Brightness.dark,


    useMaterial3: true,


    colorScheme: ColorScheme.dark(


      primary: Colors.deepPurple,


    ),



    scaffoldBackgroundColor:
    const Color(0xFF121212),



    appBarTheme: const AppBarTheme(


      backgroundColor: Colors.transparent,


      foregroundColor: Colors.white,


      elevation: 0,


    ),



    cardTheme: CardThemeData(


      elevation: 0,


      color: const Color(0xFF1E1E1E),



      shape: RoundedRectangleBorder(


        borderRadius: BorderRadius.circular(20),


      ),


    ),



    elevatedButtonTheme: ElevatedButtonThemeData(


      style: ElevatedButton.styleFrom(


        backgroundColor: Colors.deepPurple,


        foregroundColor: Colors.white,


        minimumSize: const Size(


          double.infinity,


          55,


        ),



        shape: RoundedRectangleBorder(


          borderRadius: BorderRadius.circular(16),


        ),



        textStyle: const TextStyle(


          fontSize: 16,


          fontWeight: FontWeight.bold,


        ),


      ),


    ),



    inputDecorationTheme: InputDecorationTheme(


      filled: true,


      fillColor: const Color(0xFF2A2A2A),



      border: OutlineInputBorder(


        borderRadius: BorderRadius.circular(16),


        borderSide: BorderSide.none,


      ),



      enabledBorder: OutlineInputBorder(


        borderRadius: BorderRadius.circular(16),


        borderSide: BorderSide.none,


      ),



      focusedBorder: OutlineInputBorder(


        borderRadius: BorderRadius.circular(16),


        borderSide: const BorderSide(


          color: Colors.deepPurple,


          width: 2,


        ),


      ),



      contentPadding: const EdgeInsets.symmetric(


        horizontal: 20,


        vertical: 18,


      ),


    ),



    bottomNavigationBarTheme:
    const BottomNavigationBarThemeData(


      selectedItemColor: Colors.deepPurple,


      unselectedItemColor: Colors.grey,


    ),



  );


}