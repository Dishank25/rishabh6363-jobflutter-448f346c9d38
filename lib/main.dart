import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Bloc%20State%20Management/Get%20OTP%20Bloc/GetOTP%20Bloc.dart';
import 'package:job_portal/Bloc%20State%20Management/Login%20User%20Bloc/UserLoginBloc.dart';
import 'Bloc State Management/Register User Bloc/RegisterUserBloc.dart';
import 'Data/Remote/API_Helper.dart';
import 'Screens/Common_Screens/Forgot_password_Screen.dart';
import 'Screens/Job_Related_Screens/Feed_Screen_2.dart';
import 'Screens/Log_In_Screens/Log_in_Page1.dart';
import 'Screens/Payment_Screens/Default_payment_gateway.dart';
import 'Screens/Payment_Screens/Payment_type_Screen.dart';
import 'Screens/Payment_Screens/Premium_internships_jobs.dart';
import 'Screens/Post Internships Screens/Post Internships Screen.dart';
import 'Screens/Recruiter_Profile_Screens/Recruiter_Create_Quick_Ticket.dart';
import 'Screens/Recruiter_Profile_Screens/Recruiter_ForgetPassword_Screen.dart';
import 'Screens/Recruiter_Profile_Screens/Recruiter_GST_Auth_Screen.dart';
import 'Screens/Payment_Screens/Payment_Screen.dart';
import 'Screens/Recruiter_Profile_Screens/Recruiter_ProfileScreen1.dart';
import 'Screens/Recruiter_Profile_Screens/Recruiter_profile_Screen2.dart';
import 'Screens/Recruiter_Screens/RecruiterApprovalScreen.dart';
import 'Screens/Recruiter_Screens/Recruiter_Analytics_Reports.dart';
import 'Screens/Recruiter_Screens/Recruiter_Applications_Screen.dart';
import 'Screens/Recruiter_Screens/Recruiter_Dashboard.dart';
import 'Screens/Recruiter_Screens/Recruiter_Setting_Panel.dart';
import 'Screens/Recruiter_Screens/Recruiter_Upcoming_Interviews.dart';
import 'Screens/Recruiter_Screens/Recruiter_View_Full_Application_screen.dart';
import 'Screens/Recruiter_Screens/Recruiter_pending_tasks.dart';
import 'Screens/Recruiter_Screens/Recruiter_pipeline_candidates.dart';
import 'Screens/Recruiter_Screens/Recruiter_total_job_posts.dart';
import 'Screens/User_Profile_Screens/Choose_Your_Template_Screen.dart';
import 'Screens/User_Profile_Screens/User_Notifications_Screen.dart';
import 'Screens/User_Profile_Screens/User_Profile_Screen_2.dart';
import 'Screens/User_Profile_Screens/User_change_email_screen.dart';
import 'Screens/User_Profile_Screens/User_change_password_screen.dart';
import 'Screens/User_Profile_Screens/User_messages_screen.dart';
import 'Screens/User_Profile_Screens/User_my_applications.dart';
import 'Screens/User_Profile_Screens/User_terms_conditions_screen.dart';
import 'User Authentication  And Approval Screens/User_Auth_Screen.dart';
import 'User Authentication  And Approval Screens/User_Education_Approval_Screen.dart';
import 'User Authentication  And Approval Screens/User_Experience_Approval_Screen.dart';
import 'User Authentication  And Approval Screens/User_Skills_Approval_Screen.dart';
void main() {
  runApp(MultiBlocProvider(providers:[
      BlocProvider(create:(context)=>RegisterUserBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=>UserloginBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=>GetOTPBloc(apiHelper: ApiHelper()))
  ],
      child:  MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LogInPage1(),

    );
  }
}