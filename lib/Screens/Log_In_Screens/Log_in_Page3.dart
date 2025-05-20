import 'package:flutter/material.dart';
import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import '../Job_Related_Screens/Job_Search_Screen.dart';
import '../Sign_up_Student_Screens/create_account.dart';

class LogInPage3 extends StatelessWidget {
  final String phoneNumber;
  final String receivedOtp;
  LogInPage3({required this.phoneNumber, required this.receivedOtp});
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          signInHeader( onTap:()
          {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CreateAccount()));}),
          mSpacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Phone Number", style: mTextStyle12(),),
                mSpacer(mHeight: 5.0),
                CustomTextField(controller: phoneController, hintText: "9988776655", fillColor: Colors.white,),
                mSpacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    otpContainer(),
                    otpContainer(),
                    otpContainer(),
                    otpContainer()
                  ],
                ),
                mSpacer(),
                commonRedContainer(text: "Log In",
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
                    }),
                mSpacer(mHeight: 12.0),
                Center(child: Text("Resend OTP", style: mTextStyle12(mColor: Color(0xff4D81E7)),))


              ],
            ),
          ),
          ]
      ),
    );
  }
}

 Widget otpContainer(){
  return Container(
    height: 48,
    width: 70.5,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade300, width: 1.0 )
    ),
  );
 }
