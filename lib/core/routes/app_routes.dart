import 'package:flutter/material.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/register_screen.dart';
import '../../screens/student/student_dashboard.dart';
import '../../screens/startup/startup_dashboard.dart';
import '../../screens/auth/forgot_password.dart';
import '../../screens/student/student_profile.dart';
import '../../screens/startup/startup_profile.dart';
import '../../screens/startup/create_opportunity.dart';
import '../../screens/student/opportunity_feed.dart';
import '../../screens/startup/applicants_screen.dart';
import '../../screens/student/my_applications.dart';
import '../../screens/startup/verification_pending.dart';
import '../../screens/student/saved_opportunities.dart';
import '../../screens/notifications/notification_screen.dart';
import '../../models/opportunity_model.dart';
import '../../screens/student/opportunity_details.dart';
import '../../screens/startup/startup_applications.dart';
import '../../screens/student/student_navigation.dart';
import '../../screens/startup/schedule_interview.dart';
import '../../screens/student/my_interviews.dart';
import '../../screens/startup/applicant_details.dart';
import '../../screens/student/student_interviews.dart';

class AppRoutes {


  static Map<String, WidgetBuilder> routes = {


    "/": (context)=> const SplashScreen(),

    "/onboarding": (context)=> const OnboardingScreen(),

    "/login": (context)=> const LoginScreen(),

    "/register": (context)=> const RegisterScreen(),

    "/student": (context)=> StudentNavigation(),

    "/startup": (context) => const StartupDashboard(),

    "/forgot-password": (context)=> const ForgotPasswordScreen(),

    "/student-profile": (context)=> const StudentProfile(),

    "/startup-profile": (context)=> const StartupProfile(),

    "/create-opportunity": (context)=> const CreateOpportunity(),

    "/opportunities": (context)=> const OpportunityFeed(),

    "/applicants": (context) => const ApplicantsScreen(),

    "/my-applications": (context)=> const MyApplications(),

    "/verification": (context)=>const VerificationPending(),

    "/saved-opportunities": (context)=>const SavedOpportunities(),

    "/notifications": (context)=>const NotificationScreen(),

    "/opportunity-details": (context) {

      final opportunity =
      ModalRoute.of(context)!.settings.arguments
      as OpportunityModel;


      return OpportunityDetails(
        opportunity: opportunity,
      );

    },

    "/startup-applications": (context)=>const StartupApplications(),

    "/my-interviews": (context)=>const MyInterviews(),

    "/applicant-details":
        (context) => const ApplicantDetails(),

    "/student-interviews":
        (context)=>const StudentInterviews(),


  };


}