import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_bloc.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_event.dart';
import '../../../../../ui_helper/ui_helper.dart';
import '../../../../../widgets/widgets.dart';

class UserEducationApprovalScreen extends StatefulWidget {
  const UserEducationApprovalScreen({super.key});

  @override
  State<UserEducationApprovalScreen> createState() =>
      _UserEducationApprovalScreenState();
}

class _UserEducationApprovalScreenState
    extends State<UserEducationApprovalScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController searchCourseController = TextEditingController();
  List<String> addedEducationLevels = [];
  List<EducationCardData> educationControllers = [];

  List<Map<String, dynamic>> createEducationMap() {
    return educationControllers.map((edu) {
      return {
        "level": edu.level,
        "schoolOrCollege": edu.schoolOrCollegeController.text.trim(),
        "boardOrUniversity": edu.boardOrUniversityController.text.trim(),
        "startYear": edu.startYearController.text.trim(),
        "endYear": edu.endYearController.text.trim(),
        "percentageOrCgpa": edu.percentageOrCgpaController.text.trim(),
      };
    }).toList();
  }

  void addEducationEntry(String level) {
    setState(() {
      addedEducationLevels.add(level);
      educationControllers.add(EducationCardData(
        level: level,
        schoolOrCollegeController: TextEditingController(),
        boardOrUniversityController: TextEditingController(),
        startYearController: TextEditingController(),
        endYearController: TextEditingController(),
        percentageOrCgpaController: TextEditingController(),
      ));
    });
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Education",
                  style: mTextStyle32(mColor: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: searchCourseController,
                  hintText:
                      "Select your education level (e.g. 10th, 12th, B.Tech)",
                  suffixIcon: Icons.search,
                  fillColor: Colors.white,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    final level = searchCourseController.text.trim();
                    if (level.isNotEmpty &&
                        !addedEducationLevels.contains(level)) {
                      addEducationEntry(level);
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.add, color: Colors.blue),
                      Text("Add education",
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: educationControllers.length,
                  itemBuilder: (context, index) {
                    final edu = educationControllers[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  edu.level,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedEducationLevels.remove(edu.level);
                                      educationControllers.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.close,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              controller: edu.schoolOrCollegeController,
                              hintText: "School/College",
                              fillColor: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              controller: edu.boardOrUniversityController,
                              hintText: "Board/University",
                              fillColor: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: edu.startYearController,
                                    hintText: "Start Year",
                                    fillColor: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: CustomTextField(
                                    controller: edu.endYearController,
                                    hintText: "End Year",
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              controller: edu.percentageOrCgpaController,
                              hintText: "Percentage/CGPA",
                              fillColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: nextButton(
                      title: "Save Changes",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final list = createEducationMap();
                          final map = {'educations': list};
                          final userId = sl<PreferencesManager>().getUserId();
                          context
                              .read<MyProfileBloc>()
                              .add(LoadUpdateProfile(userId ?? '2', map));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please complete all fields")),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EducationCardData {
  String level;
  TextEditingController schoolOrCollegeController;
  TextEditingController boardOrUniversityController;
  TextEditingController startYearController;
  TextEditingController endYearController;
  TextEditingController percentageOrCgpaController;

  EducationCardData({
    required this.level,
    required this.schoolOrCollegeController,
    required this.boardOrUniversityController,
    required this.startYearController,
    required this.endYearController,
    required this.percentageOrCgpaController,
  });
}
