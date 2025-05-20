import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/Screens/Job_Related_Screens/Job_details_Screen.dart';
import 'package:job_portal/UI_Helper/UI_Helper.dart';

class student_job_applications extends StatelessWidget {
  const student_job_applications({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Text("My Applications", style: mTextStyle32(mColor: Colors.black),),
          ),
          AppStatusCard(comName: "Company Name", nApplicants: "160", mDate: "30 April", statusText:"Hired" ,),
          SizedBox(height: 20,),
          AppStatusCard(comName: "Company Name", nApplicants: "230", mDate: "27 April", statusText:"Skills Missing"),
          SizedBox(height: 20,),
          AppStatusCard(comName: "Company Name", nApplicants: "230", mDate: "25 April", statusText:"Application Sent"),

        ],
      ),
      );
  }
}
/// Widget for Application status cards

class AppStatusCard extends StatelessWidget {
  final String comName, nApplicants, mDate, statusText;

  AppStatusCard(
      {required this.comName, required this.nApplicants, required this.mDate, required this.statusText});

  Color getBackgroundColor(){
    switch (statusText){
      case "Hired":
        return Color(0xffDFF7EA);
      case "Application Sent":
        return Color(0xffFFF6E4);
      case "Skills Missing":
        return Color(0xffFFE7E0);
      default:
        return Color(0xffEFF0F6);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = getBackgroundColor();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comName, style: mTextStyle14(),),
              SizedBox(height: 6,),
              greyContainer(text: statusText, bgColor: Color(0xffEFF0F6)),
              SizedBox(height: 6,),
              Text("$nApplicants applied, Applied on $mDate", style: mTextStyle12(),)


            ],
          ),
        ),
      ),
    );
  }
}
