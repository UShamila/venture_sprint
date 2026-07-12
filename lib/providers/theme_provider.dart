import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider extends ChangeNotifier {


  ThemeMode _themeMode = ThemeMode.light;


  ThemeMode get themeMode => _themeMode;



  ThemeProvider(){

    loadTheme();

  }



  Future<void> loadTheme() async {

    final prefs =
    await SharedPreferences.getInstance();


    final dark =
        prefs.getBool("darkMode") ?? false;



    _themeMode =
    dark
        ? ThemeMode.dark
        : ThemeMode.light;


    notifyListeners();

  }




  Future<void> toggleTheme() async {


    final prefs =
    await SharedPreferences.getInstance();


    if(_themeMode == ThemeMode.light){


      _themeMode =
          ThemeMode.dark;


      await prefs.setBool(
          "darkMode",
          true
      );


    }else{


      _themeMode =
          ThemeMode.light;


      await prefs.setBool(
          "darkMode",
          false
      );


    }


    notifyListeners();

  }


}