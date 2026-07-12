import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

// Providers
import 'providers/auth_provider.dart';
import 'providers/student_provider.dart';
import 'providers/startup_provider.dart';
import 'providers/opportunity_provider.dart';
import 'providers/application_provider.dart';
import 'providers/bookmark_provider.dart';
import 'providers/notification_provider.dart';
import 'providers/startup_dashboard_provider.dart';
import 'providers/startup_analytics_provider.dart';
import 'providers/theme_provider.dart';

// Theme and Routes
import 'core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
    const VentureSprint(),
  );
}



class VentureSprint extends StatelessWidget {

  const VentureSprint({super.key});


  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => StudentProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => StartupProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => OpportunityProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => ApplicationProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => BookmarkProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => NotificationProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => StartupDashboardProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => StartupAnalyticsProvider(),
        ),


        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),

      ],


      child: Consumer<ThemeProvider>(

        builder: (context, theme, child) {


          return MaterialApp(

            debugShowCheckedModeBanner: false,


            title: "VentureSprint",


            // Light Theme
            theme: AppTheme.lightTheme,


            // Dark Theme
            darkTheme: AppTheme.darkTheme,


            // Controls switching between light and dark mode
            themeMode: theme.themeMode,


            initialRoute: "/",


            routes: AppRoutes.routes,


            onUnknownRoute: (settings) {


              return MaterialPageRoute(

                builder: (_) => const Scaffold(

                  body: Center(

                    child: Text(
                      "Page not found",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                  ),

                ),

              );

            },

          );

        },

      ),

    );

  }

}