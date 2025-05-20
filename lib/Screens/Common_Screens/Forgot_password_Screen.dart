import 'package:flutter/material.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  buildCustomAppBar(titleText: "LOGO"),
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(right: 24.0,top: 7.0, left: 24.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text("Forgot Password", style: mTextStyle32(mColor: Colors.black),),
    SizedBox(height: 20,),
      Text("Email/Phone Number", style: mTextStyle12(),),
      CustomTextField(controller: email_phone_Controller, hintText: "AmanGupta@gmail.com", fillColor: Color(0xffFFF7FB),),
      SizedBox(height: 15,),
      Text("Enter OTP to verify Email or Phone number",style: mTextStyle12()),
      CustomTextField(controller: otpController, hintText: "Enter OTP", fillColor: Color(0xffFFF7FB),),
      SizedBox(height: 15,),
      Text("New Password",style: mTextStyle12()),
      CustomTextField(controller:passwordController, hintText: "******", fillColor: Color(0xffFFF7FB),suffixIcon: Icons.visibility_off_outlined,),
      SizedBox(height: 15,),
      Text("Re-type Password",style: mTextStyle12()),
      CustomTextField(controller: NewPassWordController, hintText: "******", fillColor: Color(0xffFFF7FB),suffixIcon: Icons.visibility_off_outlined,),
      SizedBox(height: 25,),
      Center(child: nextButton(title: "Save Changes", onTap: (){}))




    ]
    )
    )
        )
    );
  }
}
