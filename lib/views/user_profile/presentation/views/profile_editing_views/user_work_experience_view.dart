import 'dart:developer' as developer show log;

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/injection_container.dart';
import '../../../../../ui_helper/ui_helper.dart';
import '../../../../../Widgets/widgets.dart';
import '../../../../../utils/upload_file_get_url/presentation/bloc/upload_file_bloc.dart';
import '../../../../../utils/upload_file_get_url/presentation/bloc/upload_file_event.dart';
import '../../../../detailed_signup_student/presentation/views/signup_as_anyone_view.dart';
import '../../../domain/entities/user_details_entity.dart';
import '../../bloc/your_experience_bloc/your_experience_bloc.dart';
import '../../bloc/your_experience_bloc/your_experience_event.dart';

class UserExperienceApprovalScreen extends StatefulWidget {
  final List<UserExperienceEntity> userExperience;
  const UserExperienceApprovalScreen({super.key, required this.userExperience});

  @override
  State<UserExperienceApprovalScreen> createState() =>
      _UserExperienceApprovalScreenState();
}

class _UserExperienceApprovalScreenState
    extends State<UserExperienceApprovalScreen> {
  final TextEditingController searchJobfieldController = TextEditingController();

  List<String> workedCompanyList = [];
  List<JobExperienceFillingCardData> jobExperienceControllers = [];
  Map<String, PlatformFile> experienceProofs = {};

  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> createExperienceMap(List<dynamic> urls) {
    List<Map<String, dynamic>> experiences = [];

    for (int i = 0; i < jobExperienceControllers.length; i++) {
      final curr = jobExperienceControllers[i];
      final map = {
        "current_company": curr.company_name,
        "current_job_role": curr.jobRoleController.text.trim(),
        "start_date": curr.start_year.text.trim(),
        "end_date": curr.end_year.text.trim(),
        "status": "approved",
        "experienceCertificate": urls[i],
      };
      experiences.add(map);
    }

    return experiences;
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.userExperience.length; i++) {
      final exp = widget.userExperience[i];
      if (exp.current_company != null) {
        workedCompanyList.add(exp.current_company!);
        final object = JobExperienceFillingCardData(
          company_name: exp.current_company!,
          jobRoleController: TextEditingController(text: exp.current_job_role),
          start_year: TextEditingController(text: exp.start_date),
          end_year: TextEditingController(text: exp.end_date),
          currentCTC: TextEditingController(text: '123123'),
          expProof: exp.experienceCertificate,
        );
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
        title: Text("Your Experience", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.message), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              CustomTextField(
                controller: searchJobfieldController,
                hintText: "Select your company",
                suffixIcon: Icons.search,
                fillColor: Colors.white,
              ),
              const SizedBox(height: 24),

              // Add New Company
              GestureDetector(
                onTap: () {
                  final company = searchJobfieldController.text.trim();
                  if (!workedCompanyList.contains(company) && company.isNotEmpty) {
                    setState(() {
                      workedCompanyList.add(company);
                      final object = JobExperienceFillingCardData(
                        company_name: company,
                        expProof: null,
                        jobRoleController: TextEditingController(),
                        start_year: TextEditingController(),
                        end_year: TextEditingController(),
                        currentCTC: TextEditingController(),
                      );
                      jobExperienceControllers.add(object);
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.add, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text("Add other company", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Experience Cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jobExperienceControllers.length,
                itemBuilder: (context, index) {
                  final curr = jobExperienceControllers[index];
                  return JobExperienceFillingCard(
                    company_name: curr.company_name,
                    experienceProofName: experienceProofs[curr.company_name]?.name ??
                        (curr.expProof?.isNotEmpty == true
                            ? curr.expProof!.substring(
                          curr.expProof!.length - 10 > 0 ? curr.expProof!.length - 10 : 0,
                        )
                            : "No file"),
                    jobRoleController: curr.jobRoleController,
                    start_year: curr.start_year,
                    end_year: curr.end_year,
                    currentCTC: curr.currentCTC,
                    onTapCross: () {
                      setState(() {
                        workedCompanyList.remove(curr.company_name);
                        jobExperienceControllers.removeAt(index);
                      });
                    },
                    onTapPickCerti: () {
                      context.read<YourExperienceBloc>().add(
                        LoadPickExperienceProof(curr.company_name),
                      );
                    },
                  );
                },
              ),

              // Save Button
              Center(
                child: SizedBox(
                  width: 150,
                  child: nextButton(
                    title: "Save Changes",
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        uploadProofs();
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
    );
  }

  Future<void> uploadProofs() async {
    final formData = FormData();

    for (var exp in experienceProofs.keys) {
      final file = experienceProofs[exp];
      if (file != null && file.path != null) {
        final fileName = file.path!.split('/').last;
        final multipartFile = await MultipartFile.fromFile(file.path!, filename: fileName);
        formData.files.add(MapEntry('certificateImage', multipartFile));
      }
    }

    context.read<UploadFileBloc>().add(LoadUploadFile(formData));
  }
}

// -----------------------------
// JobExperienceFillingCard
// -----------------------------

class JobExperienceFillingCard extends StatefulWidget {
  final String company_name;
  final String? experienceProofName;
  final TextEditingController jobRoleController;
  final TextEditingController start_year;
  final TextEditingController end_year;
  final TextEditingController currentCTC;
  final VoidCallback onTapCross;
  final VoidCallback onTapPickCerti;

  const JobExperienceFillingCard({
    super.key,
    required this.company_name,
    required this.experienceProofName,
    required this.jobRoleController,
    required this.start_year,
    required this.end_year,
    required this.currentCTC,
    required this.onTapCross,
    required this.onTapPickCerti,
  });

  @override
  State<JobExperienceFillingCard> createState() => _JobExperienceFillingCardState();
}

class _JobExperienceFillingCardState extends State<JobExperienceFillingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Name Row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.company_name,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.close, size: 16),
                  onPressed: widget.onTapCross,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Job Role
            Text("Job Role/Profile", style: TextStyle(fontSize: 12)),
            CustomTextField(
              controller: widget.jobRoleController,
              hintText: "Digital Marketing",
              fillColor: Colors.white,
              validator: (value) {
                if (value == null || value.isEmpty) return "Required";
                return null;
              },
            ),

            const SizedBox(height: 8),

            // Start & End Year
            Row(
              children: [
                Expanded(
                  child: DatePickerField(
                    controller: widget.start_year,
                    fillColor: Colors.white,
                    hintText: "Choose year",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DatePickerField(
                    controller: widget.end_year,
                    fillColor: Colors.white,
                    hintText: "Choose year",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // CTC
            Text("CTC", style: TextStyle(fontSize: 12)),
            CustomTextField(
              controller: widget.currentCTC,
              hintText: "Eg. 4,00,000",
              fillColor: Colors.white,
              validator: (value) {
                if (value == null || value.isEmpty) return "Required";
                return null;
              },
            ),

            const SizedBox(height: 8),

            // Edit Certificate Button
            Row(
              children: [
                Text("Edit Certificate", style: TextStyle(color: Colors.blue)),
                const SizedBox(width: 8),
                Icon(Icons.edit, size: 16, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------
// Data Classes
// -----------------------------

class JobExperienceFillingCardData {
  final String company_name;
  final String? expProof;
  final TextEditingController jobRoleController;
  final TextEditingController start_year;
  final TextEditingController end_year;
  final TextEditingController currentCTC;

  JobExperienceFillingCardData({
    required this.company_name,
    required this.expProof,
    required this.jobRoleController,
    required this.start_year,
    required this.end_year,
    required this.currentCTC,
  });
}