import 'dart:developer' as developer show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/views/signup_as_anyone_view.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/signup_as_anyone_bloc/detailed_signup_bloc.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/signup_as_anyone_bloc/detailed_signup_event.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/signup_as_anyone_bloc/detailed_signup_state.dart';
import 'package:job_portal/views/detailed_signup_student/domain/entities/metadata_entities.dart';
import 'package:job_portal/views/user_profile/domain/entities/user_details_entity.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_bloc.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_state.dart';
import '../../../../../ui_helper/ui_helper.dart';
import '../../../../../widgets/widgets.dart';

class UserEducationApprovalScreen extends StatefulWidget {
  final List<UserEducationEntity> eduList;
  const UserEducationApprovalScreen({super.key, required this.eduList});

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
  List<SpecializationEntity> specializations = [];

  void prefillEducationData(List<UserEducationEntity> eduList) {
    setState(() {
      addedEducationLevels.clear();
      educationControllers.clear();

      for (final edu in eduList) {
        developer.log('College name : ${edu.schoolCollege?.name ?? "College"}');

        addedEducationLevels.add(edu.level);

        educationControllers.add(
          EducationCardData(
            level: edu.level,
            selectedSchoolCollegeId: edu.school_college_id,
            selectedCourseId: edu.course_id,
            selectedSpecializationId: edu.specialization_id,
            education_certificate: edu.education_certificate,

            // Controllers pre-filled
            schoolOrCollegeController: TextEditingController(
              text: edu.schoolCollege?.name ?? "College",
            ),
            boardOrUniversityController: TextEditingController(
              text: edu.board_or_university,
            ),
            startYearController: TextEditingController(
              text: edu.start_year,
            ),
            endYearController: TextEditingController(
              text: edu.end_year,
            ),
            percentageOrCgpaController: TextEditingController(
              text: edu.percentage_or_cgpa,
            ),
          ),
        );
      }
    });
  }

  List<Map<String, dynamic>> createEducationMap() {
    return educationControllers.map((edu) {
      return {
        "level": edu.level,
        "school_college_id": edu.selectedSchoolCollegeId,
        "board_or_university": edu.boardOrUniversityController.text.trim(),
        "course_id": edu.selectedCourseId,
        "specialization_id": edu.selectedSpecializationId ?? 1,
        "start_year": edu.startYearController.text.trim(),
        "end_year": edu.endYearController.text.trim(),
        "percentage_or_cgpa": edu.percentageOrCgpaController.text.trim(),
        "education_certificate": edu.education_certificate ?? "dummy.pdf",
        'schoolOrCollege': edu.schoolOrCollegeController.text.trim(),
      };
    }).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefillEducationData(widget.eduList);
  }

  void addEducationEntry(String level, {int? course_id}) {
    setState(() {
      addedEducationLevels.add(level);
      educationControllers.add(EducationCardData(
        level: level,
        selectedCourseId: course_id,
        schoolOrCollegeController: TextEditingController(),
        boardOrUniversityController: TextEditingController(),
        startYearController: TextEditingController(),
        endYearController: TextEditingController(),
        percentageOrCgpaController: TextEditingController(),
      ));
    });
  }

  @override
  void didChangeDependencies() {
    // Fetch master colleges on screen open following existing API call structure
    final Map<String, dynamic> emailMap = {};
    context
        .read<DetailedSignupBloc>()
        .add(DetailedSignupGetCollegeDetails(emailMap));
    super.didChangeDependencies();
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
                BlocBuilder<DetailedSignupBloc, DetailedSignupState>(
                  builder: (context, state) {
                    if (state is DetailedSignupGetCollegeDetailsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is DetailedSignupGetCollegeDetailsLoaded) {
                      final courses = state.coursesListResponse.courses;
                      return CustomAutocompleteGeneric<CourseEntity>(
                        options: courses,
                        label:
                            'Select your education level (e.g. 10th, 12th, B.Tech)',
                        onSelected: (course) {
                          // Set field text
                          searchCourseController.text = course.name;
                          // Add a new education card for the selected course level
                          if (!addedEducationLevels.contains(course.name)) {
                            addEducationEntry(course.name,
                                course_id: course.id);
                            // context.read<DetailedSignupBloc>().add(
                            //     DetailedSignupGetSpecializations(
                            //         course.id.toString()));
                          }
                        },
                        displayStringForOption: (course) => course.name,
                      );
                    }
                    // Fallback input if state not loaded yet
                    return CustomTextField(
                      controller: searchCourseController,
                      hintText:
                          'Select your education level (e.g. 10th, 12th, B.Tech)',
                      suffixIcon: Icons.search,
                      fillColor: Colors.white,
                    );
                  },
                ),
                const SizedBox(height: 16),
                // InkWell(
                //   onTap: () {
                //     final level = searchCourseController.text.trim();
                //     if (level.isNotEmpty &&
                //         !addedEducationLevels.contains(level)) {
                //       addEducationEntry(level);
                //     }
                //   },
                //   child: const Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Icon(Icons.add, color: Colors.blue),
                //       Text("Add education",
                //           style: TextStyle(color: Colors.blue)),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: educationControllers.length,
                  itemBuilder: (context, index) {
                    final edu = educationControllers[index];

                    return EducationFillingCard(
                      courseNameText: edu.level,
                      collegeNameController: edu.schoolOrCollegeController,
                      specializationController: edu.boardOrUniversityController,
                      startYearController: edu.startYearController,
                      endYearController: edu.endYearController,
                      specializations: specializations,
                      onSelectCollegeId: (id) {
                        edu.selectedSchoolCollegeId = id;
                      },
                      onTapCross: () {
                        setState(() {
                          addedEducationLevels.remove(edu.level);
                          educationControllers.removeAt(index);
                        });
                      },
                    );
                  },
                ),
                BlocListener<MyProfileBloc, MyProfileState>(
                  listener: (context, state) {
                    if (state is UpdateProfileLoaded) {
                      showSnackbar(
                          state.updateUserProfileEntity.message, context);
                    }
                  },
                  child: const SizedBox(),
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
                          developer.log('Education map : $map');
                          final user_id = sl<PreferencesManager>().getUserId();
                          context
                              .read<MyProfileBloc>()
                              .add(LoadUpdateProfile(user_id ?? '2', map));
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

class EducationFillingCard extends StatefulWidget {
  final String courseNameText;
  final TextEditingController collegeNameController;
  final TextEditingController specializationController;
  final TextEditingController startYearController;
  final TextEditingController endYearController;
  final List<SpecializationEntity> specializations;

  final VoidCallback onTapCross;
  final String? Function(String?)? validator;
  final void Function(int)? onSelectCollegeId;
  final void Function(int)? onSelectSpecializationId;

  const EducationFillingCard({
    super.key,
    required this.courseNameText,
    required this.collegeNameController,
    required this.specializationController,
    required this.startYearController,
    required this.endYearController,
    required this.specializations,
    required this.onTapCross,
    this.validator,
    this.onSelectCollegeId,
    this.onSelectSpecializationId,
  });

  @override
  State<EducationFillingCard> createState() => _EducationFillingCardState();
}

class _EducationFillingCardState extends State<EducationFillingCard> {
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
                // Top Row: Course + Upload/Edit
                Row(
                  children: [
                    courseName(
                      name: widget.courseNameText,
                      bgColor: const Color(0xff1961F3),
                      mIcon: Icons.cancel,
                      onTap: widget.onTapCross,
                    ),
                    const Spacer(),
                    courseName(
                      name: "View/Edit Certificate",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // College Name with autocomplete
                Text("College Name", style: mTextStyle12()),
                BlocBuilder<DetailedSignupBloc, DetailedSignupState>(
                  builder: (context, state) {
                    if (state is DetailedSignupGetCollegeDetailsLoaded) {
                      final colleges = state.collegesListResponse.colleges;
                      return CustomAutocompleteGeneric<CollegeEntity>(
                        options: colleges,
                        label: "Eg. Delhi Technological University",
                        onSelected: (college) {
                          widget.collegeNameController.text = college.name;
                          if (widget.onSelectCollegeId != null) {
                            widget.onSelectCollegeId!(college.id);
                          }
                        },
                        initialText: widget.collegeNameController.text,
                        displayStringForOption: (college) => college.name,
                      );
                    }
                    if (state is DetailedSignupGetCollegeDetailsLoading) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                            height: 36,
                            width: 36,
                            child: CircularProgressIndicator()),
                      );
                    }
                    return CustomTextField(
                      controller: widget.collegeNameController,
                      hintText: "Eg. Delhi Technological University",
                      fillColor: Colors.white,
                      validator: widget.validator,
                    );
                  },
                ),

                const SizedBox(height: 10),

                // Specialization
                Text("Specialization", style: mTextStyle12()),
                CustomAutocompleteGeneric(
                  options: widget.specializations,
                  label: 'Specialization',
                  onSelected: (value) {
                    if (widget.onSelectSpecializationId != null && value.id != null) {
                      widget.onSelectSpecializationId!(value.id!);
                    }
                    widget.specializationController.text = value.name ?? '';
                  },
                  displayStringForOption: (value) {
                    return value.name ?? '';
                  },
                  initialText: widget.specializationController.text,
                ),

                const SizedBox(height: 10),

                // Start Year & End Year Row
                Row(
                  children: [
                    Text("Start Year", style: mTextStyle12()),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 110.0),
                      child: Text("End Year", style: mTextStyle12()),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: DatePickerField(
                        controller: widget.startYearController,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: DatePickerField(
                        controller: widget.endYearController,
                        fillColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
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
  int? selectedSchoolCollegeId;
  int? selectedCourseId;
  int? selectedSpecializationId;
  String? education_certificate;

  EducationCardData({
    required this.level,
    required this.schoolOrCollegeController,
    required this.boardOrUniversityController,
    required this.startYearController,
    required this.endYearController,
    required this.percentageOrCgpaController,
    this.selectedSchoolCollegeId,
    this.selectedCourseId,
    this.selectedSpecializationId,
    this.education_certificate,
  });
}
