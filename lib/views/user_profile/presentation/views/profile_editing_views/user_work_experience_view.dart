import 'dart:developer' as developer show log;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/utils/upload_file_get_url/presentation/bloc/upload_file_bloc.dart';
import 'package:job_portal/utils/upload_file_get_url/presentation/bloc/upload_file_event.dart';
import 'package:job_portal/utils/upload_file_get_url/presentation/bloc/upload_file_state.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/views/signup_as_anyone_view.dart';
import 'package:job_portal/views/user_profile/domain/entities/user_details_entity.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_bloc.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_state.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/your_experience_bloc/your_experience_bloc.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/your_experience_bloc/your_experience_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/your_experience_bloc/your_experience_state.dart';
import '../../../../../ui_helper/ui_helper.dart';
import '../../../../../widgets/widgets.dart';

class UserExperienceApprovalScreen extends StatefulWidget {
  final List<UserExperienceEntity> userExperience;
  const UserExperienceApprovalScreen({super.key, required this.userExperience});

  @override
  State<UserExperienceApprovalScreen> createState() =>
      _UserExperienceApprovalScreenState();
}

class _UserExperienceApprovalScreenState
    extends State<UserExperienceApprovalScreen> {
  TextEditingController searchJobfieldController = TextEditingController();

  List<String> workedCompanyList = [];
  List<JobExperienceFillingCardData> jobExperienceControllers = [];
  Map<String, dynamic> experienceProofs = {};

  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> createExperienceMap(List<dynamic> urls) {
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
        "startDate": curr.startYear.text.trim(),
        "endDate": curr.endYear.text.trim(),
        "status": "approved",
        "experienceCertificate": urls[i],
      };
      experiences.add(map);
    }

    developer.log('Experiences : $experiences');

    return experiences;
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.userExperience.length; i++) {
      final exp = widget.userExperience[i];

      if (exp.currentCompany != null) {
        workedCompanyList.add(exp.currentCompany!);
        final object = JobExperienceFillingCardData(
            companyName: exp.currentCompany!,
            jobRoleController: TextEditingController(text: exp.currentJobRole),
            startYear: TextEditingController(text: exp.startDate),
            endYear: TextEditingController(text: exp.endDate),
            currentCTC:
                TextEditingController(text: '123123'), // get ctc added in api
            expProof: exp.experienceCertificate);
        jobExperienceControllers.add(object);
      }
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
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
                            expProof: null,
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
                BlocListener<UploadFileBloc, UploadFileState>(
                  listener: (context, state) {
                    if (state is UploadFileLoaded) {
                      developer.log('upload file success for proof uploads');
                      final urls = state.uploadFileEntity;
                      final list = createExperienceMap(urls.url);
                      final map = {'experiences': list};
                      final _prefs = sl<PreferencesManager>();
                      final userId = _prefs.getUserId();
                      context
                          .read<MyProfileBloc>()
                          .add(LoadUpdateProfile(userId ?? '2', map));
                    } else if (state is UploadFileLoading) {
                      developer.log('upload file loading');
                    } else if (state is UploadFileError) {
                      developer.log('upload file error');
                    }
                  },
                  child: SizedBox(),
                ),
                BlocListener<YourExperienceBloc, YourExperienceState>(
                  listener: (context, state) {
                    if (state is PickExperienceProofLoaded) {
                      setState(() {
                        experienceProofs = state.experienceProof;
                        developer.log("Experience proofs : $experienceProofs");
                      });
                      developer.log('Exp proof loaded.');
                    } else if (state is PickExperienceProofLoading) {
                      developer.log('Exp proof loading.');
                    } else if (state is PickExperienceProofError) {
                      developer.log('Exp proof error.');
                    } else if (state is NoExperienceProofPicked) {
                      developer.log('No exp proof picked.');
                    }
                  },
                  child: const SizedBox(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: jobExperienceControllers.length,
                  itemBuilder: (context, index) {
                    final curr = jobExperienceControllers[index];

                    return JobExperienceFillingCard(
                      companyName: curr.companyName,
                      jobRoleController: curr.jobRoleController,
                      experienceProofName: experienceProofs[curr.companyName]
                              ?.files
                              .first
                              .name ??
                          curr.expProof?.substring(curr.expProof!.length - 10),
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
                      onTapPickCerti: () {
                        setState(() {
                          context
                              .read<YourExperienceBloc>()
                              .add(LoadPickExperienceProof(curr.companyName));
                        });
                      },
                    );
                  },
                ),
                BlocListener<MyProfileBloc, MyProfileState>(
                  listener: (context, state) {
                    if (state is UpdateProfileLoaded) {
                      developer.log(
                          'Profile update status: ${state.updateUserProfileEntity.message}');
                      showSnackbar(
                          state.updateUserProfileEntity.message, context);
                      // Navigator.pop(context);
                    } else if (state is UpdateProfileError) {
                      developer.log('Profile update error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed to update about')),
                      );
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
                          developer.log('valid work exp');

                          // final list = createExperienceMap();
                          uploadProofs();
                        } else {
                          developer.log('invalid work exp');
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

  Future<void> uploadProofs() async {
    // Step 2: Create FormData
    final formData = FormData();

    // Step 3: Attach certificate images with indexed keys
    // ignore: unused_local_variable
    int index = 0;
    for (var exp in experienceProofs.keys) {
      final file = experienceProofs[exp].files.first;
      if (file != null) {
        final fileName = file.path.split('/').last;
        formData.files.add(
          MapEntry(
            // 'certificate_image_$index',
            'certificateImage',
            await MultipartFile.fromFile(file.path, filename: fileName),
          ),
        );
        index++;
      }
    }

    // ignore: use_build_context_synchronously
    context.read<UploadFileBloc>().add(LoadUploadFile(formData));

    developer.log(
        'For Data of skill\nfields : ${formData.fields}\nfiles : ${formData.files}');
  }
}

class JobExperienceFillingCard extends StatefulWidget {
  final String companyName;
  final String? experienceProofName;
  final TextEditingController jobRoleController;
  final TextEditingController startYear;
  final TextEditingController endYear;
  final TextEditingController currentCTC;
  final String? Function(String?)? validator;
  final VoidCallback onTapCross;
  final VoidCallback onTapPickCerti;

  const JobExperienceFillingCard({
    super.key,
    required this.companyName,
    required this.jobRoleController,
    required this.startYear,
    required this.endYear,
    required this.currentCTC,
    this.validator,
    required this.onTapCross,
    required this.onTapPickCerti,
    required this.experienceProofName,
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
                      name:
                          widget.experienceProofName ?? "View/Edit Certificate",
                      onTap: widget.onTapPickCerti,
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
  final String? expProof;
  final TextEditingController jobRoleController;
  final TextEditingController startYear;
  final TextEditingController endYear;
  final TextEditingController currentCTC;

  JobExperienceFillingCardData({
    required this.companyName,
    required this.expProof,
    required this.jobRoleController,
    required this.startYear,
    required this.endYear,
    required this.currentCTC,
  });
}
