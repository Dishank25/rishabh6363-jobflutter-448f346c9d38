import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/Widgets/widgets.dart';

import '../UI_Helper/UI_Helper.dart';

class UserAuthScreen extends StatelessWidget {
  /*final VoidCallback ? onCallBack;
  UserAuthScreen({this.onCallBack});*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/message_icon.svg"),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/notifications_icon.svg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 11.0),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Authentication", style: mTextStyle32(mColor: Colors.black),),
                    SizedBox(height: 58,),
                    Container(
                      height: 268,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffFFF6E9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffFFA322), width: 1.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                               Text("Phone Number", style: mTextStyle12(mColor: Color(0xff6C7278)),),
                               Row(
                                 children: [
                                   SizedBox(
                                       width:230,
                                     child: CustomTextField(controller: phoneController, hintText: "+91xxxxxxxxxx",fillColor: Color(0xffFFFFFC))),
                                   Spacer(),
                                   sendOTPContainer(),
        
                                 ],
                               ),
                            SizedBox(height: 4,),
                            Text("OTP",style: mTextStyle12(mColor: Color(0xff6C7278)),),
                            CustomTextField(controller: otpController, hintText: "6 digit number",fillColor: Color(0xffFFFFFC)),
                            SizedBox(height: 20,),
                            Center(
                              child: SizedBox(
                                width: 204,
                                  child: commonRedContainer(text: "Verify Phone Number")),
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap:(){},
                                    child: Text("Resend OTP", style: mTextStyle12(mColor: AppColors.blueTextColor,),)),
                                Text(" in 15 seconds")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 21,),
                    Container(
                      height: 430,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xffFFF6E9),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xffFFA322), width: 1.0)
                      ),
                      child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Aadhar ID",style: mTextStyle12(mColor: Color(0xff6C7278))),
                            CustomTextField(controller: AadharController, hintText: "Aadhar Card Number",fillColor: Color(0xffFFFFFC)),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Text("Date of Birth",style: mTextStyle12(mColor: Color(0xff6C7278),)),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 100.0),
                                  child: Text("Upload file",style: mTextStyle12(mColor: Color(0xff6C7278))),
                                ),
                              ],
                            ),
                            SizedBox(height: 2,),
                            Row(
                              children: [
                                SizedBox(width:165,
                                    child: CustomTextField(controller: DOBController , hintText: "DD/MM/YYYY",fillColor: Color(0xffFFFFFC))),
                               Spacer(),
                                SizedBox(
                                  width: 165,
                                  child: CustomTextField(controller: uploadController, hintText:"Browse File", suffixIcon: Icons.upload_file,fillColor: Color(0xffFFFFFC)),
                                )
                              ],
                            ),
                            SizedBox(height: 4,),
                        Text("Linked Phone Number", style: mTextStyle12(mColor: Color(0xff6C7278)),),
                        Row(
                          children: [
                            SizedBox(
                                width:230,
                                child: CustomTextField(controller: linkedPhoneController, hintText: "+91xxxxxxxxxx",fillColor: Color(0xffFFFFFC))),
                            Spacer(),
                            sendOTPContainer(),
                          ],
                        ),
                            SizedBox(height: 4,),
                            Text("OTP",style: mTextStyle12(mColor: Color(0xff6C7278)),),
                            CustomTextField(controller: otpController, hintText: "6 digit number",fillColor: Color(0xffFFFFFC)),
                            SizedBox(height: 20,),
                            Center(
                              child: SizedBox(
                                  width: 204,
                                  child: commonRedContainer(text: "Verify Phone Number")),
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap:(){},
                                    child: Text("Resend OTP", style: mTextStyle12(mColor: AppColors.blueTextColor,),)),
                                Text(" in 15 seconds")
                              ],
                            ),
                      ],
                    ),
                    ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff1DB32F), width: 1.0),
                        color: Color(0xffDFF7EA)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email ID", style: mTextStyle12(),),
                            SizedBox(height: 4,),
                            CustomTextField(controller: emailController, hintText: "ABC@gmail.com", fillColor: Color(0xffFFFFFC),),
                            SizedBox(height: 4,),
                            InkWell(
                              onTap: (){},
                                child: Text("Edit/Change", style: mTextStyle12(mColor: AppColors.blueTextColor),)),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,)
             ]
        )
        ),
      )
    );
  }
}

 Widget sendOTPContainer(){
  return Container(
    height: 48,
    width: 100,
    decoration: BoxDecoration(
      color: Color(0xffFFA322),
      borderRadius: BorderRadius.circular(10)
    ),
    child: Center(child: Text("Send OTP",style: mTextStyle14(mColor: Colors.white),)),
  );
 }


