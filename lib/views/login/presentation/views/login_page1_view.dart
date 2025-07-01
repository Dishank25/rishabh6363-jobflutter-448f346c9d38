import 'dart:developer' as developer show log;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/Common_Screens/Forgot_password_Screen.dart';
import 'package:job_portal/views/login/presentation/bloc/remote_login_bloc.dart';
import 'package:job_portal/views/login/presentation/bloc/remote_login_event.dart';
import 'package:job_portal/views/login/presentation/bloc/remote_login_state.dart';
import 'package:job_portal/views/signup/presentation/views/singup_student1_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../ui_helper/ui_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../../signup/presentation/views/login_with_email_otp_view.dart';
import '../../../signup/presentation/views/create_account.dart';
import 'loginWithEmailOTP.dart';

class LogInPage1 extends StatefulWidget {
  @override
  State<LogInPage1> createState() => _SignInPage_1State();
}

class _SignInPage_1State extends State<LogInPage1> {
  String token = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "LOGO",
            style: mTextStyle12(mColor: Colors.white),
          ),
        ),
        backgroundColor: AppColors.mainIndigoColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            signInHeader(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccount(),
                  ),
                );
              },
            ),
            mSpacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email", style: mTextStyle14()),
                    CustomTextField(
                      controller: emailController,
                      hintText: "abc@gmail.com",
                      fillColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    mSpacer(mHeight: 16.0),
                    Text("Password", style: mTextStyle14()),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "*******",
                      suffixIcon: Icons.visibility_off_outlined,
                      fillColor: Colors.white,
                      // isObscure: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    mSpacer(mHeight: 16.0),
                    forgetPassRow(ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                    }),
                    mSpacer(mHeight: 30.0),
                    BlocListener<RemoteLoginBloc, RemoteLoginState>(
                      listener: (context, state) {
                        if (state is RemoteLoginError) {
                          showSnackbar(
                              'There was an error logging in.', context);
                        } else if (state is RemoteLoginLoaded) {
                          final data = state.loginUserResponse;

                          if (data.message == 'Login successful') {
                            showSnackbar('Login successful', context);
                            developer.log('Login data : ${data.toString()}');

                            final prefs = sl<PreferencesManager>();
                            prefs.setToken(data.token);
                            prefs.setUserId(data.user.id.toString());
                          }
                        }
                      },
                      child: commonRedContainer(
                        text: "Log In",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final loginMap = {
                              "email": emailController.text.trim(),
                              "password": passwordController.text.trim(),
                            };

                            developer.log('Login Map : ${loginMap.toString()}');

                            context
                                .read<RemoteLoginBloc>()
                                .add(RemoteLoginData(loginMap));
                          }
                        },
                      ),
                    ),

                    // commonRedContainer(
                    //   text: "Log In",
                    //   onTap: () async {
                    //     if (_formKey.currentState!.validate()) {
                    //       // context.read<UserloginBloc>().add(
                    //       //   UserLoginEvent(bodyParams: {
                    //       //     "email": emailController.text.trim(),
                    //       //     "password": passwordController.text.trim(),
                    //       //   }),
                    //       // );
                    //       /*SharedPreferences prefs =
                    //       await SharedPreferences.getInstance();
                    //       prefs.setString("token", token);*/
                    //       final loginMap = {
                    //         "email": emailController.text.trim(),
                    //         "password": passwordController.text.trim(),
                    //       };
                    //       developer.log('Login Map : ${loginMap.toString()}');
                    //       context
                    //           .read<RemoteLoginBloc>()
                    //           .add(RemoteLoginData(loginMap));
                    //     }
                    //   },
                    // ),
                    mSpacer(mHeight: 30.0),
                    dividerLine(),
                    mSpacer(),
                    belowBars(
                        text: "Continue with Google",
                        imgUrl: "assets/Icons/google.svg",
                        onTap: () {}),
                    mSpacer(),
                    belowBars(
                      text: "Login with OTP",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginWithEmailOtpScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
