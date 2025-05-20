import 'package:flutter/material.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';

class RecruiterForgetpasswordScreen extends StatefulWidget {
  @override
  State<RecruiterForgetpasswordScreen> createState() => _RecruiterForgetpasswordScreenState();
}

class _RecruiterForgetpasswordScreenState extends State<RecruiterForgetpasswordScreen> {
  bool _obscurePassword = true;

  bool _obscureReEnter = true;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  buildCustomAppBar(titleText: ""),
       body: SingleChildScrollView(
       child: Padding(
       padding: const EdgeInsets.only(right: 24.0,top: 7.0, left: 24.0),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    Text("Forget Password", style: mTextStyle32(mColor: Colors.black),),
               SizedBox(height: 20,),
                  Text("Email/Phone Number",style: mTextStyle12(),),
               SizedBox(height: 4,),
                   CustomTextField(controller: emailController, hintText: "abc@gmail.com"),
                   SizedBox(height: 20,),
                   Text("Enter OTP to verify your Email/Phone Number",style: mTextStyle12(),),
                   SizedBox(height: 4,),
                   CustomTextField(controller: otpController, hintText: "abc@gmail.com"),
                   SizedBox(height: 20,),
                   Text("New Password",style: mTextStyle12(),),
                   SizedBox(height: 4,),
                   CustomTextField(
                     controller: passwordController,
                     hintText: "abc@gmail.com",
                     obscureText: _obscurePassword,
                     suffixIcon: _obscurePassword
                         ? Icons.visibility_off_outlined
                         : Icons.visibility_outlined,
                     onSuffixTap: () {
                       setState(() {
                         _obscurePassword = !_obscurePassword;
                       });
                     },
                   ),
                   SizedBox(height: 20,),
                   Text("Re-enter Password",style: mTextStyle12(),),
                   SizedBox(height: 4,),
                   CustomTextField(controller:newPassController ,
                       hintText: "abc@gmail.com",
                       obscureText: _obscureReEnter,
                     suffixIcon: _obscureReEnter
                         ? Icons.visibility_off_outlined
                         : Icons.visibility_outlined,
                     onSuffixTap: () {
                       setState(() {
                         _obscureReEnter = !_obscureReEnter;
                       });
                     },),
                   SizedBox(height: 20,),
                   Center(child: nextButton(title: "Save Changes", onTap: (){}))
    ]
    )
    )
       )
   );
  }
}
