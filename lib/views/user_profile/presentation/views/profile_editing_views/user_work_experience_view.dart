import 'dart:developer' as developer show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/views/signup_as_anyone_view.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_bloc.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_state.dart';
import '../../../../../ui_helper/ui_helper.dart';
import '../../../../../widgets/widgets.dart';

class UserExperienceApprovalScreen extends StatefulWidget {
  const UserExperienceApprovalScreen({super.key});

  @override
  State<UserExperienceApprovalScreen> createState() =>
      _UserExperienceApprovalScreenState();
}

class _UserExperienceApprovalScreenState
    extends State<UserExperienceApprovalScreen> {
  TextEditingController searchJobfieldController = TextEditingController();
  // TextEditingController JobProfileController = TextEditingController();
  // TextEditingController JobStartDate = TextEditingController();
  // TextEditingController jobEndDate = TextEditingController();
  // TextEditingController salarryController = TextEditingController();

  List<String> workedCompanyList = [];
  List<JobExperienceFillingCardData> jobExperienceControllers = [];

  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> createExperienceMap() {
    List<Map<String, dynamic>> experiences = [];

    for (int i = 0; i < jobExperienceControllers.length; i++) {
      final curr = jobExperienceControllers[i];
      // developer.log(
      //     'Start date : ${curr.startYear.text.trim()} \nEnd Date : ${curr.endYear.text.trim()}');
      // developer.log(
      //     'Total experience : ${calculateExperience(curr.startYear.text.trim(), curr.endYear.text.trim())}');
      final map = {
        "currentCompany": curr.companyName,
        "currentJobRole": curr.jobRoleController.text.trim(),
        "totalExperience": calculateExperience(
            curr.startYear.text.trim(), curr.endYear.text.trim()),
        "status": "approved"
      };
      experiences.add(map);
    }

    developer.log('Experiences : $experiences');

    return experiences;
  }

  String calculateExperience(String startDateStr, String endDateStr) {
    try {
      // Parse the input date strings
      final startDate = DateFormat("d MMMM yyyy").parse(startDateStr);
      final endDate = DateFormat("d MMMM yyyy").parse(endDateStr);

      // Get the difference in days
      final totalDays = endDate.difference(startDate).inDays;

      if (totalDays < 0) return "0.0";

      // Convert days to years (rounded to 1 decimal)
      final totalYears = totalDays / 365;
      final roundedYears = (totalYears * 10).round() / 10;

      return roundedYears.toStringAsFixed(1); // Example: "1.5"
    } catch (e) {
      return "0.0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset("assets/Icons/message_icon.svg"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset("assets/Icons/notifications_icon.svg"),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Experience",
                      style: mTextStyle32(mColor: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: searchJobfieldController,
                      hintText: "Select your company",
                      suffixIcon: Icons.search,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () {
                        final company = searchJobfieldController.text.trim();

                        if (!workedCompanyList.contains(company) &&
                            company.isNotEmpty) {
                          setState(() {
                            workedCompanyList.add(company);
                            final object = JobExperienceFillingCardData(
                                companyName: company,
                                jobRoleController: TextEditingController(),
                                startYear: TextEditingController(),
                                endYear: TextEditingController(),
                                currentCTC: TextEditingController());
                            jobExperienceControllers.add(object);
                          });
                          developer.log('added');
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                          Text(
                            'Add other company',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: jobExperienceControllers.length,
                      itemBuilder: (context, index) {
                        // final jobRoleController = TextEditingController();
                        // final startYear = TextEditingController();
                        // final endYear = TextEditingController();
                        // final currentCTC = TextEditingController();
                        final curr = jobExperienceControllers[index];

                        return JobExperienceFillingCard(
                          // companyName: workedCompanyList[index],
                          companyName: curr.companyName,
                          jobRoleController: curr.jobRoleController,
                          startYear: curr.startYear,
                          endYear: curr.endYear,
                          currentCTC: curr.currentCTC,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This value is required';
                            }
                            return null;
                          },
                          onTapCross: () {
                            setState(() {
                              workedCompanyList.remove(curr.companyName);
                              jobExperienceControllers.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                    // Container(
                    //     width: double.infinity,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xffDFF7EA),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Padding(
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 10.0, vertical: 10.0),
                    //         child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Row(
                    //                 children: [
                    //                   courseName(
                    //                       name: "Uber",
                    //                       bgColor: Color(0xff1961F3),
                    //                       mIcon: Icons.cancel,
                    //                       onTap: () {}),
                    //                   Spacer(),
                    //                   courseName(
                    //                       name: "View/Edit Certificate",
                    //                       onTap: () {})
                    //                 ],
                    //               ),
                    //               const SizedBox(height: 4),
                    //               Text(
                    //                 "Job Role/Profile",
                    //                 style: mTextStyle12(),
                    //               ),
                    //               CustomTextField(
                    //                 controller: JobProfileController,
                    //                 hintText: "Digital Marketing",
                    //                 fillColor: Colors.white,
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     "Start Year",
                    //                     style: mTextStyle12(),
                    //                   ),
                    //                   Spacer(),
                    //                   Padding(
                    //                     padding: const EdgeInsets.only(
                    //                         right: 110.0),
                    //                     child: Text(
                    //                       "End Year",
                    //                       style: mTextStyle12(),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               const SizedBox(height: 4),
                    //               Row(
                    //                 children: [
                    //                   SizedBox(
                    //                       width: 165,
                    //                       child: CustomTextField(
                    //                         controller: JobStartDate,
                    //                         hintText: "Choose Year",
                    //                         suffixIcon: Icons.arrow_drop_down,
                    //                         fillColor: Colors.white,
                    //                         onSuffixTap: () {},
                    //                       )),
                    //                   Spacer(),
                    //                   SizedBox(
                    //                       width: 165,
                    //                       child: CustomTextField(
                    //                         controller: jobEndDate,
                    //                         hintText: "Choose Year",
                    //                         suffixIcon: Icons.arrow_drop_down,
                    //                         fillColor: Colors.white,
                    //                         onSuffixTap: () {},
                    //                       )),
                    //                 ],
                    //               ),
                    //               const SizedBox(height: 4),
                    //               Text(
                    //                 "Current CTC",
                    //                 style: mTextStyle12(),
                    //               ),
                    //               CustomTextField(
                    //                 controller: salarryController,
                    //                 hintText: "Eg. 4,00,000",
                    //                 fillColor: Colors.white,
                    //               ),
                    //             ]))),
                    // const SizedBox(height: 20),

                    BlocListener<MyProfileBloc, MyProfileState>(
                        listener: (context, state) {
                          if (state is UpdateProfileLoaded) {
                            developer.log(
                                'Profile update status: ${state.updateUserProfileEntity.message}');
                            Navigator.pop(context);
                          } else if (state is UpdateProfileError) {
                            developer.log('Profile update error');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Failed to update about')),
                            );
                          }
                        },
                        child: SizedBox()),
                    Center(
                        child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: nextButton(
                          title: "Save Changes",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              developer.log('valid work exp');
                              final list = createExperienceMap();
                              final map = {'experiences': list};
                              final _prefs = sl<PreferencesManager>();
                              final userId = _prefs.getUserId();
                              context
                                  .read<MyProfileBloc>()
                                  .add(LoadUpdateProfile(userId ?? '2', map));
                            } else {
                              developer.log('invalid work exp');
                            }
                          }),
                    )),
                    const SizedBox(height: 50),
                  ])),
        )));
  }
}

class JobExperienceFillingCard extends StatefulWidget {
  final String companyName;
  final TextEditingController jobRoleController;
  final TextEditingController startYear;
  final TextEditingController endYear;
  final TextEditingController currentCTC;
  final String? Function(String?)? validator;
  final VoidCallback onTapCross;

  const JobExperienceFillingCard({
    super.key,
    required this.companyName,
    required this.jobRoleController,
    required this.startYear,
    required this.endYear,
    required this.currentCTC,
    this.validator,
    required this.onTapCross,
  });

  @override
  State<JobExperienceFillingCard> createState() =>
      _JobExperienceFillingCardState();
}

class _JobExperienceFillingCardState extends State<JobExperienceFillingCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(29, 179, 47, 0.1),
            border: Border.all(color: const Color.fromRGBO(29, 179, 47, 0.2)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    courseName(
                      name: widget.companyName,
                      bgColor: Color(0xff1961F3),
                      mIcon: Icons.cancel,
                      onTap: widget.onTapCross,
                      // onCrossTap: widget.onTapCross,
                    ),
                    Spacer(),
                    courseName(
                      name: "View/Edit Certificate",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Job Role/Profile",
                  style: mTextStyle12(),
                ),
                CustomTextField(
                  controller: widget.jobRoleController,
                  hintText: "Digital Marketing",
                  fillColor: Colors.white,
                  validator: widget.validator,
                ),
                Row(
                  children: [
                    Text(
                      "Start Year",
                      style: mTextStyle12(),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 110.0),
                      child: Text(
                        "End Year",
                        style: mTextStyle12(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Row(
                //   children: [
                //     SizedBox(
                //         width: 165,
                //         child: CustomTextField(
                //           controller: widget.startYear,
                //           hintText: "Choose Year",
                //           suffixIcon: Icons.arrow_drop_down,
                //           fillColor: Colors.white,
                //           onSuffixTap: () {},
                //           validator: widget.validator,
                //         )),
                //     const Spacer(),
                //     SizedBox(
                //       width: 165,
                //       child: CustomTextField(
                //         controller: widget.endYear,
                //         hintText: "Choose Year",
                //         suffixIcon: Icons.arrow_drop_down,
                //         fillColor: Colors.white,
                //         onSuffixTap: () {},
                //         validator: widget.validator,
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Expanded(
                      child: DatePickerField(
                        controller: widget.startYear,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: DatePickerField(
                        controller: widget.endYear,
                        fillColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Current CTC",
                  style: mTextStyle12(),
                ),
                CustomTextField(
                  controller: widget.currentCTC,
                  hintText: "Eg. 4,00,000",
                  fillColor: Colors.white,
                  validator: widget.validator,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class UserExperience {
  final String currentCompany;
  final String currentJobRole;
  final String totalExperience;
  final String status;

  UserExperience({
    required this.currentCompany,
    required this.currentJobRole,
    required this.totalExperience,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'currentCompany': currentCompany,
      'currentJobRole': currentJobRole,
      'totalExperience': totalExperience,
      'status': status,
    };
  }
}

class JobExperienceFillingCardData {
  final String companyName;
  final TextEditingController jobRoleController;
  final TextEditingController startYear;
  final TextEditingController endYear;
  final TextEditingController currentCTC;

  JobExperienceFillingCardData({
    required this.companyName,
    required this.jobRoleController,
    required this.startYear,
    required this.endYear,
    required this.currentCTC,
  });
}
