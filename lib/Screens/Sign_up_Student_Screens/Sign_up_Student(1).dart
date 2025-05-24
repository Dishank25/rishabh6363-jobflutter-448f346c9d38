import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Bloc%20State%20Management/Send_Mail_OTP_API/Send_mail_otp_event.dart';
import 'package:job_portal/Screens/Log_In_Screens/Log_in_Page1.dart';
import 'package:job_portal/Screens/Sign_up_Student_Screens/Sign_up_Student(2).dart';

import '../../Bloc State Management/Register User API/RegisterUserBloc.dart';
import '../../Bloc State Management/Register User API/RegisterUserEvent.dart';
import '../../Bloc State Management/Register User API/RegisterUserState.dart';
import '../../Bloc State Management/Send_Mail_OTP_API/Send_mail_otp_bloc.dart';
import '../../Bloc State Management/Send_Mail_OTP_API/Send_mail_otp_state.dart';
import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';

class SignUpStudent_1 extends StatefulWidget {
  final String userType;

  const SignUpStudent_1({super.key, required this.userType});

  @override
  State<SignUpStudent_1> createState() => _SignUpStudent_1State();
}

class _SignUpStudent_1State extends State<SignUpStudent_1> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: MultiBlocListener(
        listeners: [
          BlocListener<RegisterUserBloc, RegisterUserState>(
            listener: (context, state) async {
              if (state is RegisterUserLoadingState) {
                setState(() => isLoading = true);
              } else {
                setState(() => isLoading = false);
              }

              if (state is RegisterUserFailedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMsg)),
                );
              }

              if (state is RegisterUserSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("User registered successfully")));
              }
            },
          ),
          BlocListener<SendOTPBloc, SendOTPState>(
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
                    builder: (_) => SignUpStudent_2(Email:emailController.text ,),
                  ),
                );
              }

              if (state is SendOTPFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign Up", style: mTextStyle32(mColor: Color(0xff1A1C1E))),
                mSpacer(),
                Text("Create an account to continue!", style: mTextStyle14()),
                mSpacer(mHeight: 24.0),

                Text("First Name", style: mTextStyle12()),
                CustomTextField(
                  controller: firstNameController,
                  hintText: "Aman",
                  suffixIcon: Icons.person,
                  fillColor: Color(0xffFFF7FB),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'First name required' : null,
                ),
                mSpacer(mHeight: 15.0),
                Text("Last Name", style: mTextStyle12()),
                CustomTextField(
                  controller: surnameController,
                  hintText: "Gupta",
                  fillColor: Color(0xffFFF7FB),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Last name required' : null,
                ),

                mSpacer(mHeight: 15.0),
                Text("Email", style: mTextStyle12()),
                CustomTextField(
                  controller: emailController,
                  hintText: "abc@gmail.com",
                  suffixIcon: Icons.email,
                  fillColor: Color(0xffFFF7FB),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Email required';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Enter a valid email';
                    return null;
                  },
                ),

                mSpacer(mHeight: 15.0),
                Text("Password", style: mTextStyle12()),
                CustomTextField(
                  controller: passwordController,
                  hintText: "*******",
                  suffixIcon: Icons.visibility_off_outlined,
                  fillColor: Color(0xffFFF7FB),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Password required';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),

                mSpacer(mHeight: 15.0),
                Text("Phone Number", style: mTextStyle12()),
                CustomTextField(
                  controller: phoneController,
                  hintText: "7895674320",
                  keyboardType: TextInputType.number,
                  suffixIcon: Icons.call,
                  fillColor: Color(0xffFFF7FB),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Phone Number required';
                    if (value.length < 10) return 'Phone Number must be 10 digits';
                    return null;
                  },
                ),

                mSpacer(),
                commonRedContainer(
                  text: "Register",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      final body = {
                        "firstName": firstNameController.text.trim(),
                        "lastName": surnameController.text.trim(),
                        "email": emailController.text.trim(),
                        "phone": phoneController.text.trim(),
                        "password": passwordController.text,
                        "userRole": widget.userType,
                      };

                      context.read<RegisterUserBloc>().add(
                        RegisteredUserEvent(bodyParams: body),
                      );

                      context.read<SendOTPBloc>().add(
                        TriggerSendOTPEvent(email: emailController.text.trim()),
                      );
                    }
                  },
                ),

                mSpacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("By signing up, you agree to our", style: mTextStyle12()),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Terms and Conditions",
                        style: mTextStyle14(
                          mFontWeight: FontWeight.w900,
                          mColor: AppColors.blueTextColor,
                        ),
                      ),
                    )
                  ],
                ),
                mSpacer(mHeight: 20.0),
                dividerLine(),
                mSpacer(),
                belowBars(text: "Continue with Google", imgUrl: "assets/Icons/google.svg"),
                mSpacer(mHeight: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: mTextStyle12()),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => LogInPage1()),
                        );
                      },
                      child: Text(
                        " Login",
                        style: mTextStyle14(
                          mColor: AppColors.blueTextColor,
                          mFontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}