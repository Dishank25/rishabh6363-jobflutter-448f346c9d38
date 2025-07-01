import 'dart:developer' as developer show log;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/utils/constants/enums.dart';
import 'package:job_portal/views/recruiter_signup/presentation/bloc/recruiter_signup_bloc.dart';
import 'package:job_portal/views/recruiter_signup/presentation/bloc/recruiter_signup_state.dart';
import 'package:job_portal/views/recruiter_signup/presentation/bloc/recruiter_singup_event.dart';
import 'package:job_portal/views/recruiter_signup/presentation/views/Recruiter_verify_email_screen.dart';
import '../../../../ui_helper/ui_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../../login/presentation/views/login_page1_view.dart';

class RecruiterSignupPage extends StatelessWidget {
  TextEditingController eController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  RecruiterSignupPage({super.key});

  Map<String, dynamic> createSignupParams() {
    Map<String, dynamic> registerationMap = {
      "firstName": recruiterNameController.text.trim(),
      "lastName": recruiter_SurNameController.text.trim(),
      "email": eController.text.trim(),
      "phone": phoneController.text.trim(),
      "password": pController.text.trim(),
      "userRole": USERTYPE.COMPANY.name
    };

    return registerationMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Container(
        width: double.infinity,
        // height: 710,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mSpacer(mHeight: 20.0),
                Text(
                  "Sign Up",
                  style: mTextStyle32(mColor: const Color(0xff1A1C1E)),
                ),
                mSpacer(),
                Text(
                  "Create an account to continue!",
                  style: mTextStyle12(),
                ),
                mSpacer(mHeight: 16.0),
                Text(
                  "Official Email",
                  style: mTextStyle12(),
                ),
                CustomTextField(
                  controller: eController,
                  hintText: "abc@gmail.com",
                  fillColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                mSpacer(mHeight: 16.0),
                Text("Password", style: mTextStyle12()),
                CustomTextField(
                  controller: pController,
                  hintText: "*******",
                  suffixIcon: Icons.visibility_off_outlined,
                  fillColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                mSpacer(mHeight: 24.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "First Name",
                        style: mTextStyle12(),
                      ),
                    ),
                    // Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Last Name",
                          style: mTextStyle12(),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: CustomTextField(
                          controller: recruiterNameController,
                          hintText: "Aman",
                          fillColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'First name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    // Spacer(),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: CustomTextField(
                          controller: recruiter_SurNameController,
                          hintText: "Gupta",
                          fillColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Last name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                mSpacer(),
                Text("Phone Number", style: mTextStyle12()),
                CustomTextField(
                  controller: phoneController,
                  hintText: "7895674320",
                  keyboardType: TextInputType.number,
                  suffixIcon: Icons.call,
                  fillColor: Color(0xffFFF7FB),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Phone Number required';
                    if (value.length < 10 || value.length > 10)
                      return 'Phone Number must be 10 digits';
                    return null;
                  },
                ),
                mSpacer(),
                BlocListener<RecruiterSignupBloc, RecruiterSignupState>(
                  listener: (context, state) {
                    if (state is RecruiterSignupLoaded) {
                      final data = state.signUpUserEntity;

                      if (data.message == "User registered") {
                        developer.log('Navigating on successful signup.');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecruiterVerifyEmailScreen(),
                          ),
                        );
                      } else if (data.message == "Email already exists") {
                        showSnackbar('Email already exists', context);
                      }
                    }
                  },
                  child: commonRedContainer(
                    text: "Register",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        final registerationMap = createSignupParams();
                        developer
                            .log('Recruiter params log : $registerationMap');
                        context
                            .read<RecruiterSignupBloc>()
                            .add(RecruiterSignupData(registerationMap));
                      } else {
                        showSnackbar('Please fill all the details.', context);
                      }
                    },
                  ),
                ),
                mSpacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By signing up, you agree to our",
                      style: mTextStyle12(),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Terms and Conditions",
                        style: mTextStyle12(mFontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                mSpacer(mHeight: 26.0),
                dividerLine(),
                mSpacer(),
                belowBars(
                    text: "Continue with Google",
                    imgUrl: "assets/Icons/google.svg"),
                mSpacer(mHeight: 60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: mTextStyle12(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogInPage1(),
                          ),
                        );
                      },
                      child: Text(
                        " Login",
                        style: mTextStyle12(
                            mColor: AppColors.blueTextColor,
                            mFontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
