import 'package:flutter/material.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../Log_In_Screens/Log_in_Page1.dart';
import '../Recruiter_Screens/Recruiter_SignUp_Page.dart';
import 'Sign_up_Student(1).dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  int ? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text("Logo", style: mTextStyle15(mColor: Color(0xff032466), mFontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 84,
                width: double.infinity,
                child:Text("Create a new\naccount", style: mTextStyle32(mColor:Color(0xff1A1C1E)),),
              ),
              mSpacer(mHeight: 12.0),
              Text("Join us and find your dream job or recruit talented\ncandidates.", style: mTextStyle12(),),
              mSpacer(),
             OptionContainer(
               index: 0,
                 isSelected: selectedIndex==0,
                 title1:"Sign up as a Student/Professional", title2: "Apply for jobs, Learn",
             onTap: (){
                 setState(() {
                   selectedIndex=0;
                 });
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpStudent_1(userType: "STUDENT",)));
             }),
              mSpacer(mHeight: 24.0),
              OptionContainer(
                index: 1,
                  isSelected: selectedIndex==1,
                  title1: "Sign up as a company ", title2: "Hire talent, Offer career opportunities",
              onTap: (){
                  setState(() {
                    selectedIndex=1;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RecruiterSignupPage()));
              }),
              mSpacer(mHeight: 24.0),
              OptionContainer(
                index: 2,
                  isSelected: selectedIndex==2,
                  title1: "Sign up as a University", title2: "Find best placements for students ",
              onTap: (){
                  setState(() {
                    selectedIndex=2;
                  });
              }),
         SizedBox(height: 250,),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: mTextStyle12(),),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInPage1()));
                      },
                        child: Text(" Login", style: mTextStyle12(mColor: AppColors.blueTextColor,mFontWeight: FontWeight.w600),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/// OPTION CONTAINER TO SIGN UP AS STUDENT/COMPANY/UNIVERSITY
 Widget OptionContainer({
   required String title1, required String title2,
   required int index, required bool isSelected, required VoidCallback onTap}){
  final borderColor = isSelected? AppColors.mainRedColor: AppColors.mainIndigoColor;
  final textColor = isSelected? AppColors.mainRedColor: AppColors.mainIndigoColor;
  final fillColor = isSelected? Color(0xffFFE4DB): Color(0xffDFEAFB);
  return  InkWell(
    onTap: onTap,
    child: Container(
      height: 81,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor,width: 1.0),
        color: fillColor
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0, top: 14.0, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                mSpacer(mHeight: 7.0),
                Text(
                  title2,
                  style: mTextStyle12(mColor: textColor),
                ),
              ],
            ),
          ),
          if(isSelected)
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppColors.mainRedColor,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 12),
            ),
          ),
        ],
      ),
    ),
  );
 }