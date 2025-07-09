import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/utils/network/dio_client.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/signup_as_anyone_bloc/detailed_signup_bloc.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_bloc.dart';
import 'package:job_portal/views/job_related/presentation/bloc/job_bloc/job_bloc.dart';
import 'package:job_portal/views/job_related/presentation/bloc/job_details_bloc/job_details_bloc.dart';
import 'package:job_portal/views/login/presentation/bloc/remote_login_bloc.dart';
import 'package:job_portal/views/post_opportunities/presentation/bloc/opportunity_bloc.dart';
import 'package:job_portal/views/signup_recruiter/presentation/bloc/recruiter_signup_bloc/recruiter_signup_bloc.dart';
import 'package:job_portal/views/signup_recruiter/presentation/bloc/verify_otp_recruiter_bloc/verify_otp_recruiter_bloc.dart';
import 'package:job_portal/views/signup_student/presentation/bloc/remote_signup_bloc/remote_signup_bloc.dart';
import 'package:job_portal/views/signup_student/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/Common_Screens/Forgot_password_Screen.dart';
import 'views/job_related/presentation/views/Feed_Screen_2.dart';
import 'views/login/presentation/views/login_page_first_view.dart';
import 'views/Payment_Screens/Default_payment_gateway.dart';
import 'views/Payment_Screens/Payment_type_Screen.dart';
import 'views/Payment_Screens/Premium_internships_jobs.dart';
import 'views/post_opportunities/presentation/views/post_opportunity_screen.dart';
import 'views/Recruiter_Profile_Screens/Recruiter_Create_Quick_Ticket.dart';
import 'views/Recruiter_Profile_Screens/Recruiter_GST_Auth_Screen.dart';
import 'views/Payment_Screens/Payment_Screen.dart';
import 'views/Recruiter_Profile_Screens/Recruiter_ProfileScreen1.dart';
import 'views/Recruiter_Profile_Screens/Recruiter_profile_Screen2.dart';
import 'views/signup_recruiter/presentation/views/RecruiterApprovalScreen.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_Analytics_Reports.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_Applications_Screen.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_Dashboard.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_Setting_Panel.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_Upcoming_Interviews.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_View_Full_Application_screen.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_pending_tasks.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_pipeline_candidates.dart';
import 'views/signup_recruiter/presentation/views/Recruiter_total_job_posts.dart';
import 'views/signup_student/presentation/views/login_with_email_otp_view.dart';
import 'views/detailed_signup_student/presentation/views/signup_as_anyone_view.dart.dart';
import 'views/User_Profile_Screens/Choose_Your_Template_Screen.dart';
import 'views/User_Profile_Screens/User_Notifications_Screen.dart';
import 'views/User_Profile_Screens/User_Profile_Screen_2.dart';
import 'views/User_Profile_Screens/User_change_email_screen.dart';
import 'views/User_Profile_Screens/User_change_password_screen.dart';
import 'views/User_Profile_Screens/User_messages_screen.dart';
import 'views/User_Profile_Screens/User_my_applications.dart';
import 'views/User_Profile_Screens/User_terms_conditions_screen.dart';
import 'user_authentication_and_approval_screens/User_Auth_Screen.dart';
import 'user_authentication_and_approval_screens/User_Education_Approval_Screen.dart';
import 'user_authentication_and_approval_screens/User_Experience_Approval_Screen.dart';
import 'user_authentication_and_approval_screens/User_Skills_Approval_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<RemoteSignupBloc>()),
        BlocProvider(create: (_) => sl<RemoteLoginBloc>()),
        BlocProvider(create: (_) => sl<DetailedSignupBloc>()),
        BlocProvider(create: (_) => sl<SkillBloc>()),
        BlocProvider(create: (_) => sl<RecruiterSignupBloc>()),
        BlocProvider(create: (_) => sl<OpportunityBloc>()),
        BlocProvider(create: (_) => sl<JobBloc>()),
        BlocProvider(create: (_) => sl<JobDetailsBloc>()),
        BlocProvider(create: (_) => sl<VerifyOtpBloc>()),
        BlocProvider(create: (_) => sl<VerifyOtpRecruiterBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: LogInPage1(),
      ),
    );
  }
}
