import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/Bloc%20State%20Management/Verify%20email%20API/Verify_Email_Event.dart';
import 'package:job_portal/Screens/Log_In_Screens/Log_in_Page1.dart';
import 'package:job_portal/Screens/Sign_up_Student_Screens/Sign_up_Student(2).dart';
import 'package:job_portal/UI_Helper/UI_Helper.dart';
import 'package:job_portal/Widgets/widgets.dart';

import '../../Bloc State Management/Send_Mail_OTP_API/Send_mail_otp_bloc.dart';
import '../../Bloc State Management/Send_Mail_OTP_API/Send_mail_otp_event.dart';
import '../../Bloc State Management/Send_Mail_OTP_API/Send_mail_otp_state.dart';
import '../../Bloc State Management/Verify OTP API/VerifyOTP Event.dart';
import '../../Bloc State Management/Verify email API/Verify Email Bloc.dart';
import '../../Bloc State Management/Verify email API/Verify Email State.dart';
import '../Log_In_Screens/EnterEmailOTpScreen.dart';
import 'create_account.dart';

class LoginWithEmailOtpScreen extends StatefulWidget {


  @override
  State<LoginWithEmailOtpScreen> createState() => _LoginWithEmailOtpScreen();
}

class _LoginWithEmailOtpScreen extends State<LoginWithEmailOtpScreen> {
  TextEditingController emailOTPController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendOTPBloc, SendOTPState>(
      listener: (context, state) async {
        if (state is SendOTPLoading) {
          setState(() => isLoading = true);
        } else {
          setState(() => isLoading = false);
        }

        if (state is SendOTPSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("OTP sent to your email")),
          );

          await Future.delayed(Duration(seconds: 1));
          if (!mounted) return;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => EnterEmailOTpScreen(email: emailOTPController.text,),
            ),
          );
        }

        if (state is SendOTPFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        appBar:  AppBar(
               title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("LOGO", style: mTextStyle12(mColor: Colors.white),),
         ),
      backgroundColor: AppColors.mainIndigoColor),
        body: Column(
          children: [
            signInHeader(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccount()),
                );
              },
            ),
            mSpacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter your Email", style: mTextStyle14(mColor: Colors.grey.shade600)),
                  SizedBox(height: 3,),
                  CustomTextField(controller: emailOTPController, hintText: "Enter your email"),
                  SizedBox(height: 30),
                  commonRedContainer(
                    text: "Get OTP",
                    onTap: () {

                      context.read<SendOTPBloc>().add(
                          TriggerSendOTPEvent(email: emailOTPController.text.trim()));
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend code in 15 seconds",
                        style: mTextStyle12(mColor: AppColors.blueTextColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Can’t find our email? Check your spam folder or promotions tab too!",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}