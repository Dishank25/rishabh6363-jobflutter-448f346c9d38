import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Bloc%20State%20Management/Verify%20email%20API/Verify%20Email%20Bloc.dart';

import 'Bloc State Management/Colleges Names API/Colleges Bloc.dart';
import 'Bloc State Management/Colleges Names API/Colleges Event.dart';
import 'Bloc State Management/Courses Names API/Course Bloc.dart';
import 'Bloc State Management/Courses Names API/Course Event.dart';
import 'Bloc State Management/Domain Skills API/DomainSkills Bloc.dart';
import 'Bloc State Management/Domain Skills API/DomainSkills Event.dart';
import 'Bloc State Management/Fetch User Basic Details API/Fetch BasicDetails Bloc.dart';
import 'Bloc State Management/Forget Password OTP API/Forget Password OTP Bloc.dart';
import 'Bloc State Management/Get OTP API/GetOTP Bloc.dart';
import 'Bloc State Management/Job Location API/Job Locations Bloc.dart';
import 'Bloc State Management/Job Location API/Job Locations Event.dart';
import 'Bloc State Management/Job Roles API/Job Role Bloc.dart';
import 'Bloc State Management/Job Roles API/Job Role Event.dart';
import 'Bloc State Management/Login User API/UserLoginBloc.dart';
import 'Bloc State Management/New Password API/New Password Bloc.dart';
import 'Bloc State Management/Register User API/RegisterUserBloc.dart';

import 'Bloc State Management/Related Skills API/Related Skills Bloc.dart';
import 'Bloc State Management/Related Skills API/Related Skills Event.dart';
import 'Bloc State Management/Send_Mail_OTP_API/Send_mail_otp_bloc.dart';
import 'Bloc State Management/Specialization API/Specialization Bloc.dart';
import 'Bloc State Management/Specialization API/Specialization Event.dart';
import 'Bloc State Management/Verify OTP API/VerifyOTP Bloc.dart';
import 'Data/Remote/API_Helper.dart';
import 'Screens/Common_Screens/Forgot_password_Screen.dart';
import 'Screens/Job_Related_Screens/Feed_Screen_2.dart';
import 'Screens/Log_In_Screens/Log_in_Page1.dart';
import 'Screens/Payment_Screens/Default_payment_gateway.dart';
import 'Screens/Payment_Screens/Payment_type_Screen.dart';
import 'Screens/Payment_Screens/Premium_internships_jobs.dart';
import 'Screens/Post Internships Screens/Post Internships Screen.dart';
import 'Screens/Recruiter_Profile_Screens/Recruiter_Create_Quick_Ticket.dart';
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
import 'Screens/Sign_up_Student_Screens/LoginWithEmailOtpScreen.dart';
import 'Screens/Sign_up_Student_Screens/SignUp_As_any_one.dart';
import 'Screens/User_Profile_Screens/Choose_Your_Template_Screen.dart';
import 'Screens/User_Profile_Screens/User_Notifications_Screen.dart';
import 'Screens/User_Profile_Screens/User_Profile_Screen_2.dart';
import 'Screens/User_Profile_Screens/User_change_email_screen.dart';
import 'Screens/User_Profile_Screens/User_change_password_screen.dart';
import 'Screens/User_Profile_Screens/User_messages_screen.dart';
import 'Screens/User_Profile_Screens/User_my_applications.dart';
import 'Screens/User_Profile_Screens/User_terms_conditions_screen.dart';
import 'Service_locator/Service_Locator.dart';
import 'User Authentication  And Approval Screens/User_Auth_Screen.dart';
import 'User Authentication  And Approval Screens/User_Education_Approval_Screen.dart';
import 'User Authentication  And Approval Screens/User_Experience_Approval_Screen.dart';
import 'User Authentication  And Approval Screens/User_Skills_Approval_Screen.dart';
void main() {
  runApp(MultiBlocProvider(providers:[
      BlocProvider(create:(context)=>RegisterUserBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=>UserloginBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=>VerifyOTPBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=> ForgotPasswordBloc()),
    BlocProvider(create: (context)=>ResetPasswordBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=>FetchUserBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=>SendOTPBloc(apiHelper: ApiHelper())),
  BlocProvider(create: (context) => CourseBloc(CourseRepository())..add(FetchCourses())),
    BlocProvider(create: (context)=>CollegeBloc(CollegeRepository())..add(FetchColleges())),
    BlocProvider(create: (context)=>EmailVerificationBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=> SpecializationBloc(SpecializationRepository())..add(FetchSpecializations())),
    BlocProvider(create: (context)=> JobRoleBloc(JobRoleRepository())..add(FetchJobRoles())),
    BlocProvider(create: (context)=> JobLocationsBloc(JobLocationRepository())..add(FetchJobLocations())),
  BlocProvider(
  create: (_) => DomainBloc(getIt<DomainRepository>())..add(FetchDomains())),
   BlocProvider(create: (context)=>RelatedSkillsBloc(RelatedSkillsRepository())),

  

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