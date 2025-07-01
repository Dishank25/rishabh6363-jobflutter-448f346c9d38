import 'package:flutter/material.dart';
import 'package:job_portal/views/Post%20Internships%20Screens/Post%20Internships%20Screen.dart';

import '../../../../ui_helper/ui_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../../login/presentation/views/login_page1_view.dart';

class RecruiterVerifyEmailScreen extends StatelessWidget {
  TextEditingController timePassController = TextEditingController();

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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              mSpacer(mHeight: 20.0),
              Text(
                "Verify your email",
                style: mTextStyle32(mColor: Color(0xff1A1C1E)),
              ),
              mSpacer(),
              Text(
                "One Time Password (OTP) has been sent on amangupta@gmail.com",
                style: mTextStyle12(),
              ),
              mSpacer(mHeight: 26.0),
              Text(
                "Enter OTP to verify your email",
                style: mTextStyle12(),
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                  width: double.infinity,
                  child: CustomTextField(
                      controller: timePassController,
                      hintText: "Enter OTP",
                      fillColor: Colors.white)),
              mSpacer(),
              SizedBox(
                  width: double.infinity,
                  child: commonRedContainer(
                      text: "Verify Email",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostInternshipsScreen()));
                      })),
              mSpacer(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Text(
                          "Resend code",
                          style: mTextStyle12(mColor: AppColors.blueTextColor),
                        )),
                    Text(
                      " in 15 seconds",
                      style: mTextStyle12(),
                    )
                  ],
                ),
              ),
              mSpacer(mHeight: 44.0),
              Container(
                height: 36,
                width: 313,
                child: Text(
                  "Can't find our mail? Check your spam folder or promotions tab too",
                  style: mTextStyle12(),
                  textAlign: TextAlign.center,
                ),
              ),
              mSpacer(mHeight: 243.0),
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
                      ))
                ],
              ),
            ]),
          ),
        ));
  }
}
