import 'dart:developer' as developer show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/utils/constants/enums.dart';
import 'package:job_portal/views/Bottom_Nav_Bar/Student_Bottom_Nav_Bar.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/signup_as_anyone_bloc/detailed_signup_bloc.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/signup_as_anyone_bloc/detailed_signup_event.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/signup_as_anyone_bloc/detailed_signup_state.dart';
import '../../../../ui_helper/ui_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../../Job_Related_Screens/Job_Search_Screen.dart';

class SignupPageYourPreferences extends StatefulWidget {
  Map<String, dynamic> params;
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
  String courseEndYear;*/
  SignupPageYourPreferences({super.key, required this.params});
  @override
  _SignupPageYourPreferencesState createState() =>
      _SignupPageYourPreferencesState();
}

class _SignupPageYourPreferencesState extends State<SignupPageYourPreferences> {
  final Set<String> selectedPreferences = {};
  final Set<String> selectedWorkModes = {};

  void togglePreference(String title) {
    setState(() {
      if (selectedPreferences.contains(title)) {
        selectedPreferences.remove(title);
      } else {
        selectedPreferences.clear();
        selectedPreferences.add(title);
      }
    });
  }

  void toggleWorkMode(String title) {
    setState(() {
      if (selectedWorkModes.contains(title)) {
        selectedWorkModes.remove(title);
      } else {
        selectedWorkModes.clear();
        selectedWorkModes.add(title);
      }
    });
  }

  String cleanString(String input) {
    return input.replaceAll('+', '').trim();
  }

  Future<void> onPressedFindOpportunities() async {
    // add preferences to params
    widget.params.addAll({
      DETAILEDPROFILEPARAMS.currentlyLookingFor.name:
          cleanString(selectedPreferences.first),
      DETAILEDPROFILEPARAMS.workMode.name: cleanString(selectedWorkModes.first),
    });

    final dummyMap = {
      "userId": 63,
      "firstName": "Megha",
      "lastName": "Gupta",
      "email": "axxa@gmail.com",
      "phone": "58798598",
      "dob": "1990-01-01",
      "city": "Delhi",
      "gender": "Female",
      "userType": "Working Professional",
      "jobLocation": "San Francisco",
      "experiences": [
        {
          "userId": 63,
          "companyRecruiterProfileId": "4",
          "jobRole": "Software Engineer",
          "company": "OriginCore",
          "startDate": "2022-01-01",
          "endDate": "2023-01-01",
          "description": "Worked on backend development"
        }
      ],
      "salaryDetails": "100000",
      "currentlyLookingFor": "job",
      "workMode": "Remote"
    };

    // context
    //     .read<DetailedSignupBloc>()
    //     .add(DetailedSingupSubmitUserDetails(widget.params));
    context
        .read<DetailedSignupBloc>()
        .add(DetailedSingupSubmitUserDetails(dummyMap));

    developer.log('Params in preferences screen : ${widget.params}');

    Map<String, dynamic> payload = {
      "userId": 58,
      "firstName": "Megha",
      "lastName": "Gupta",
      "email": "a@gmail.com",
      "phone": "58798598",
      "dob": "1990-01-01",
      "city": "Delhi",
      "gender": "Female",
      "userType": "Working Professional",
      "jobLocation": "San Francisco",
      "experiences": [
        {
          "userId": 57,
          "companyRecruiterProfileId": "4",
          "jobRole": "Software Engineer",
          "company": "OriginCore",
          "startDate": "2022-01-01",
          "endDate": "2023-01-01",
          "description": "Worked on backend development"
        }
      ],
      "salaryDetails": "100000",
      "currentlyLookingFor": "job",
      "workMode": "Remote"
    };

    // developer.log('Detailed Profile Payload : $payload');
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
              Text("Logo",
                  style: mTextStyle15(
                      mColor: Color(0xff032466), mFontWeight: FontWeight.w700)),
              mSpacer17(),
              Container(
                height: 42,
                width: double.infinity,
                child: Text("Your Preferences",
                    style: mTextStyle32(mColor: Color(0xff1A1C1E))),
              ),
              Text("Help us match you with the best career opportunities",
                  style: mTextStyle12()),
              mSpacer(mHeight: 25.0),
              SizedBox(height: 3),
              mSpacer(mHeight: 25.0),

              /// Preferences Section
              Text("Currently looking for:", style: mTextStyle12()),
              Wrap(
                runSpacing: 12,
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
                    isSelected: selectedPreferences.contains("Projects +"),
                    onTap: () => togglePreference("Projects +"),
                  ),
                ],
              ),
              mSpacer(mHeight: 25.0),

              // /// Work Mode Section
              Text("Work Mode:", style: mTextStyle12()),
              Wrap(
                runSpacing: 12,
                children: [
                  OptionContainer(
                    title: "In-Office  +",
                    isSelected: selectedWorkModes.contains("In-Office  +"),
                    onTap: () => toggleWorkMode("In-Office  +"),
                  ),
                  const SizedBox(width: 12),
                  OptionContainer(
                    title: "Hybrid  +",
                    isSelected: selectedWorkModes.contains("Hybrid  +"),
                    onTap: () => toggleWorkMode("Hybrid  +"),
                  ),
                  const SizedBox(width: 12),
                  OptionContainer(
                    title: "Work From Home  +",
                    isSelected: selectedWorkModes.contains("Work From Home  +"),
                    onTap: () => toggleWorkMode("Work From Home  +"),
                  ),
                ],
              ),
              mSpacer(mHeight: 25.0),

              BlocListener<DetailedSignupBloc, DetailedSignupState>(
                listener: (context, state) {
                  if (state is DetailedSingupSubmitUserDetailsLoaded) {
                    final data = state.submitDetailedUserProfile;

                    if (data.message ==
                        'User details and experiences added successfully.') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Student_Bottom_Nav_bar(),
                        ),
                      );
                    } else {
                      showSnackbar(data.message, context);
                    }
                  } else if (state is DetailedSingupSubmitUserDetailsError) {
                    showSnackbar(
                        'We encountered some error submiting your profile.',
                        context);
                  }
                },
                child: Center(
                  child: SizedBox(
                    width: 139,
                    child: nextButton(
                      title: "Find opportunities",
                      onTap: () async {
                        await onPressedFindOpportunities();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const Student_Bottom_Nav_bar(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
              ),

              /// Button
            ],
          ),
        ),
      ),
    );
  }
}
