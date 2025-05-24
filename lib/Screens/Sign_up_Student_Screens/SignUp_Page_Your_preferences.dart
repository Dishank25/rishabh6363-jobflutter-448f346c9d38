import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Bottom_Nav_Bar/Student_Bottom_Nav_Bar.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import '../Job_Related_Screens/Job_Search_Screen.dart';

class SignupPageYourPreferences extends StatefulWidget {
 /* String firstName;
  String surName;
  String gender;
  String DOB;
  String phoneNumber;
  String email;
  String jobPreferenceLocation;
  String currentLocation;
  String ? userCategory;
  String totalWorkExp;
  String currentJobRole;
  String currentCompany;
  String jobStartYear;
  String jobEndYear;
  String ? studentClass;
  String ? course;
  String CollegeName;
  String Specialization;
  String courseStartYear;
  String courseEndYear;
  SignupPageYourPreferences({required this.firstName,required this.surName, required this.email, required this.currentCompany, required this.CollegeName,
    this.course, required this.courseEndYear, required this.courseStartYear, required this.currentJobRole, required this.currentLocation,
    required this.DOB, required this.gender, required this.jobEndYear, required this.jobPreferenceLocation,
    required this.jobStartYear, required this.Specialization, this.studentClass, required this.totalWorkExp, this.userCategory,
    required this.phoneNumber});*/
  @override
  _SignupPageYourPreferencesState createState() => _SignupPageYourPreferencesState();
}

class _SignupPageYourPreferencesState extends State<SignupPageYourPreferences> {
  final Set<String> selectedPreferences = {};
  final Set<String> selectedWorkModes = {};

  void togglePreference(String title) {
    setState(() {
      if (selectedPreferences.contains(title)) {
        selectedPreferences.remove(title);
      } else {
        selectedPreferences.add(title);
      }
    });
  }

  void toggleWorkMode(String title) {
    setState(() {
      if (selectedWorkModes.contains(title)) {
        selectedWorkModes.remove(title);
      } else {
        selectedWorkModes.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Logo", style: mTextStyle15(mColor: Color(0xff032466), mFontWeight: FontWeight.w700)),
              mSpacer17(),
              Container(
                height: 42,
                width: double.infinity,
                child: Text("Your Preferences", style: mTextStyle32(mColor: Color(0xff1A1C1E))),
              ),
              Text("Help us match you with the best career opportunities", style: mTextStyle12()),
              mSpacer(mHeight: 25.0),
              SizedBox(height: 3),
              mSpacer(mHeight: 25.0),

              /// Preferences Section
              Text("Currently looking for:", style: mTextStyle12()),
              Row(
                children: [
                  OptionContainer(
                    title: "Jobs +",
                    isSelected: selectedPreferences.contains("Jobs +"),
                    onTap: () => togglePreference("Jobs +"),
                  ),
                  SizedBox(width: 12),
                  OptionContainer(
                    title: "Internships +",
                    isSelected: selectedPreferences.contains("Internships +"),
                    onTap: () => togglePreference("Internships +"),
                  ),
                  SizedBox(width: 12),
                  OptionContainer(
                    title: "Projects  +",
                    isSelected: selectedPreferences.contains("Projects  +"),
                    onTap: () => togglePreference("Projects  +"),
                  ),
                ],
              ),
              mSpacer(mHeight: 25.0),

              /// Work Mode Section
              Text("Work Mode:", style: mTextStyle12()),
              Row(
                children: [
                  OptionContainer(
                    title: "In-Office  +",
                    isSelected: selectedWorkModes.contains("In-Office  +"),
                    onTap: () => toggleWorkMode("In-Office  +"),
                  ),
                  SizedBox(width: 12),
                  OptionContainer(
                    title: "Hybrid  +",
                    isSelected: selectedWorkModes.contains("Hybrid  +"),
                    onTap: () => toggleWorkMode("Hybrid  +"),
                  ),
                  SizedBox(width: 12),
                  OptionContainer(
                    title: "Work From Home  +",
                    isSelected: selectedWorkModes.contains("Work From Home  +"),
                    onTap: () => toggleWorkMode("Work From Home  +"),
                  ),
                ],
              ),
              mSpacer(mHeight: 25.0),

              /// Button
              Center(
                child: SizedBox(
                  width: 139,
                  child: nextButton(
                    title: "Find opportunities",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Student_Bottom_Nav_bar()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}