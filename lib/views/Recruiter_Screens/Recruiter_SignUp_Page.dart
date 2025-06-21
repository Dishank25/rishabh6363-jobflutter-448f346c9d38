import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/views/Recruiter_Screens/Recruiter_verify_email_screen.dart';

import '../../ui_helper/ui_helper.dart';
import '../../widgets/widgets.dart';
import '../login/presentation/views/login_page1_view.dart';

class RecruiterSignupPage extends StatelessWidget {
  TextEditingController eController = TextEditingController();
  TextEditingController pController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Container(
          width: double.infinity,
          height: 710,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mSpacer(mHeight: 20.0),
                Text(
                  "Sign Up",
                  style: mTextStyle32(mColor: Color(0xff1A1C1E)),
                ),
                mSpacer(),
                Text(
                  "Create an account to continue!",
                  style: mTextStyle12(),
                ),
                mSpacer(mHeight: 24.0),
                Row(
                  children: [
                    Text(
                      " First Name",
                      style: mTextStyle12(),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: Text(
                        "Last Name",
                        style: mTextStyle12(),
                      ),
                    )
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceA,
                  children: [
                    SizedBox(
                        width: 165,
                        child: CustomTextField(
                            controller: recruiterNameController,
                            hintText: "Aman",
                            fillColor: Colors.white)),
                    Spacer(),
                    SizedBox(
                        width: 165,
                        child: CustomTextField(
                            controller: recruiter_SurNameController,
                            hintText: "Gupta",
                            fillColor: Colors.white)),
                  ],
                ),
                mSpacer(mHeight: 16.0),
                Text(
                  "Official Email",
                  style: mTextStyle12(),
                ),
                CustomTextField(
                    controller: eController,
                    hintText: "abc@gmail.com",
                    fillColor: Colors.white),
                mSpacer(mHeight: 16.0),
                Text("Password", style: mTextStyle12()),
                CustomTextField(
                    controller: pController,
                    hintText: "*******",
                    suffixIcon: Icons.visibility_off_outlined,
                    fillColor: Colors.white),
                mSpacer(),
                commonRedContainer(
                    text: "Register",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RecruiterVerifyEmailScreen()));
                    }),
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
                        ))
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
                                builder: (context) => LogInPage1()));
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
        ));
  }
}
