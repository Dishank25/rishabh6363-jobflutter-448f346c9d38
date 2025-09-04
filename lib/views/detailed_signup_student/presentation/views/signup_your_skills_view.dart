import 'dart:convert';
import 'dart:developer' as developer show log;

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/constants/image_string.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/utils/upload_file_get_url/presentation/bloc/upload_file_bloc.dart';
import 'package:job_portal/utils/upload_file_get_url/presentation/bloc/upload_file_event.dart';
import 'package:job_portal/utils/upload_file_get_url/presentation/bloc/upload_file_state.dart';
import 'package:job_portal/views/detailed_signup_student/domain/entities/metadata_entities.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_bloc.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_event.dart'
as se;
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_state.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/views/signup_your_preferences_view.dart';
import 'package:job_portal/ui_helper/ui_helper.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_bloc.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_state.dart';
import 'package:job_portal/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPageYourSkills extends StatefulWidget {
  Map<String, dynamic> params;
  SignupPageYourSkills({super.key, required this.params});

  @override
  State<SignupPageYourSkills> createState() => _SignupPageYourSkillsState();
}

class _SignupPageYourSkillsState extends State<SignupPageYourSkills> {
  TextEditingController skillsSearchController = TextEditingController();
  String? token;
  String? selectedDomain;

  final _prefs = sl<PreferencesManager>();

  final _formKey = GlobalKey<FormState>();
  UniqueKey _autoCompleteKey = UniqueKey();

  // /// Domain Skills Drop Down
  // final LayerLink _domainLink = LayerLink();
  // final GlobalKey _domainFieldKey = GlobalKey();
  // OverlayEntry? _domainOverlayEntry;

  List<DomainEntity> allDomains = [];
  List<String> tempSelectedDomains = [];
  List<String> selectedDomains = [];

  var skillParams = {};
  Map<String, List<SkillEntity>> subSkillsMap = {};
  Map<String, List<SkillEntity>> selectedSubSkillsPerDomain = {};
  final Map<String, TextEditingController> courseCollegeControllers = {};
  Map<String, dynamic> certificateImages = {};
  Map<String, dynamic> finalSkillData = {};

  // void _showDomainDropdown(
  //     BuildContext context, TextEditingController controller) {
  //   final renderBox =
  //   _domainFieldKey.currentContext!.findRenderObject() as RenderBox;
  //   final size = renderBox.size;
  //   final offset = renderBox.localToGlobal(Offset.zero);
  //
  //   // context.read<DomainBloc>().add(FetchDomains());
  //
  //   _domainOverlayEntry = OverlayEntry(
  //     builder: (context) => Positioned(
  //       width: size.width,
  //       left: offset.dx,
  //       top: offset.dy + size.height,
  //       child: CompositedTransformFollower(
  //         link: _domainLink,
  //         offset: Offset(0, size.height),
  //         child: Material(
  //           elevation: 4,
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //       ),
  //     ),
  //   );
  //
  //   Overlay.of(context).insert(_domainOverlayEntry!);
  // }
  //
  // @override
  // void dispose() {
  //   // Ensure any active overlay is removed to prevent _dependents assertion error
  //   _domainOverlayEntry?.remove();
  //   _domainOverlayEntry = null;
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
  }

  // Create a param for skills selected. to preserve state when going back and fourth.
  Future<void> cacheSkills() async {
    var map = {
      'selectedDomains': selectedDomains,
      'selectedSubSkillsPerDomain': selectedSubSkillsPerDomain
    };

    await _prefs.setSkillParams(map);
  }

  int iterator = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final bloc = context.read<SkillBloc>();
    bloc.add(const se.LoadDomains());

    // context.read<SkillBloc>().add(LoadSubSkills(tempSelectedDomains.first));

    super.didChangeDependencies();
  }

  void _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(""),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) =>
        //                   SignupPageYourPreferences(params: {})));
        //     },
        //     icon: const Icon(Icons.double_arrow),
        //   )
        // ],
        leading: IconButton(
            onPressed: () async {
              await cacheSkills();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 42,
                  width: double.infinity,
                  child: Text(
                    "Your Skills",
                    style: mTextStyle32(mColor: Color(0xff1A1C1E)),
                  ),
                ),
                mSpacer(mHeight: 25.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mSpacer(mHeight: 8.0),
                    BlocListener<SkillBloc, SkillState>(
                      listener: (context, state) {
                        if (state is SkillStateDomainLoaded) {
                          setState(() {
                            allDomains = state.domainAllResponse.domains;
                          });
                        } else if (state is SubSkillLoaded) {
                          final data = state.subSkillResponse;
                          final domain = state.domain;
                          developer.log('Subskills loaded.');
                          if (!subSkillsMap.containsKey(domain)) {
                            developer.log('Subskills loaded unique.');
                            setState(() {
                              subSkillsMap[domain] = data.skills;
                              developer.log('Subskills map : $subSkillsMap');
                            });
                          }
                        } else if (state is SkillCertificatesLoaded) {
                          final certificates = state.skillCertificates;

                          setState(() {
                            certificateImages = certificates;
                          });

                          developer.log('Certificates : $certificates');
                        } else if (state is SkillCertificateLoading) {
                          developer.log('Picking Certificate.');
                        }
                      },
                      child: Container(
                        key: _autoCompleteKey,
                        child: CustomAutocompleteGeneric(
                          options: allDomains,
                          label: 'Select Area of interest',
                          displayStringForOption: (p0) => p0.name,
                          onSelected: (value) {
                            if (!selectedDomains.contains(value.name)) {
                              context.read<SkillBloc>().add(se.LoadSubSkills(
                                  value.name, value.id.toString()));
                              setState(() {
                                selectedDomains.add(value.name);
                                _autoCompleteKey = UniqueKey(); // Reset the key to clear the input
                              });
                            } else {
                              showSnackbar('Skill already selected.', context);
                              setState(() {
                                _autoCompleteKey = UniqueKey(); // Reset the key even on error
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    mSpacer(mHeight: 16.0),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: selectedDomains.length,
                      itemBuilder: (context, index) {
                        final domain = selectedDomains[index];
                        final subSkills = subSkillsMap[domain] ?? [];
                        final selectedSkills =
                            selectedSubSkillsPerDomain[domain] ?? [];

                        // Initialize the controller if not already present
                        courseCollegeControllers.putIfAbsent(
                            domain, () => TextEditingController());

                        return Column(
                          children: [
                            preferenceContainer(
                              cName: domain,
                              fileName:
                              certificateImages[domain]?.files.first.name,
                              onTap: () {},
                              subSkills: subSkills,
                              selectedSubSkills: selectedSkills,
                              onSkillTap: (skill) {
                                setState(() {
                                  final selected =
                                      selectedSubSkillsPerDomain[domain] ?? [];
                                  if (selected.contains(skill)) {
                                    selected.remove(skill);
                                  } else {
                                    selected.add(skill);
                                  }
                                  selectedSubSkillsPerDomain[domain] =
                                      List.from(selected);
                                });
                              },
                              courseCollegeController:
                              courseCollegeControllers[domain]!,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter the details';
                                }
                                return null;
                              },
                              onUploadCertificateTap: () {
                                if (domain.isNotEmpty) {
                                  final skill = domain;
                                  developer.log('Skill : $skill');
                                  if (skill != null) {
                                    context.read<SkillBloc>().add(
                                        se.PickCertificate(skillName: skill));
                                  } else {
                                    // show snackbar or dialog to tell user to select only one
                                    showSnackbar(
                                        'Please select only one skill to upload certificate.',
                                        context);
                                  }
                                }
                              },
                              onCrossTap: () {
                                setState(() {
                                  courseCollegeControllers.remove(domain);
                                  // remove the certificate for this skill too
                                  context.read<SkillBloc>().add(
                                      se.RemoveCertificate(skillName: domain));
                                  selectedSubSkillsPerDomain.remove(domain);
                                  selectedDomains.removeAt(index);
                                });
                              },
                            ),
                            mSpacer(),
                          ],
                        );
                      },
                    ),
                    mSpacer(mHeight: 24.0),
                    BlocListener<MyProfileBloc, MyProfileState>(
                      listener: (context, state) {
                        if (state is UpdateProfileLoaded) {
                          developer.log('update profile loaded in skills screen');
                          showSnackbar(state.updateUserProfileEntity.message, context);
                          // ✅ Removed Navigator.pop(context) — we are moving forward, not back
                        } else if (state is UpdateProfileLoading) {
                          developer.log('update profile loading in skills screen');
                        } else if (state is UpdateProfileError) {
                          developer.log('update profile error in skills screen');
                        }
                      },
                      child: const SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // nextButton(
                        //   title: "Next",
                        //   onTap: () async {
                        //     if (_formKey.currentState!.validate()) {
                        //       final skillData = await createParamsForSkill();
                        //       context
                        //           .read<SkillBloc>()
                        //           .add(SubmitSkills(skillData));
                        //       _prefs.clear(PreferencesManager.SKILL_PARAMS);
                        //     } else {
                        //       showSnackbar(
                        //           'Please enter all the details', context);
                        //     }
                        //   },
                        // ),
                        BlocListener<UploadFileBloc, UploadFileState>(
                          listener: (context, state) {
                            if (state is UploadFileLoaded) {
                              final urls = state.uploadFileEntity;

                              finalSkillData = createSkillList(urls.url);

                              final _prefs = sl<PreferencesManager>();
                              final user_id = _prefs.getUserId();
                              context.read<MyProfileBloc>().add(
                                  LoadUpdateProfile(
                                      user_id ?? '6', finalSkillData));
                            } else if (state is UploadFileLoading) {
                              developer.log(
                                  'Wait we are uploading your certificates.');
                            } else if (state is UploadFileError) {
                              developer
                                  .log('Error while uploading certificates.');
                            }
                          },
                          child: const SizedBox(),
                        ),
                        nextButton(
                          title: "Save Changes",
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await uploadCertificates();
                              _prefs.clear(PreferencesManager.SKILL_PARAMS);

                              final Map<String, dynamic> paramsCopy = Map.from(widget.params);

                              // ✅ Ensure all required fields are present
                              final userId = _prefs.getUserId();
                              if (userId != null) paramsCopy['user_id'] = userId;

                              if (!paramsCopy.containsKey('first_name')) {
                                showSnackbar('First name is missing. Please go back and check.', context);
                                return;
                              }
                              if (!paramsCopy.containsKey('email')) {
                                showSnackbar('Email is missing.', context);
                                return;
                              }
                              if (!paramsCopy.containsKey('gender')) {
                                showSnackbar('Gender is missing.', context);
                                return;
                              }
                              if (!paramsCopy.containsKey('dob')) {
                                showSnackbar('Date of birth is missing.', context);
                                return;
                              }
                              if (!paramsCopy.containsKey('phone')) {
                                showSnackbar('Phone number is missing.', context);
                                return;
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPageYourPreferences(
                                    params: paramsCopy,
                                  ),
                                ),
                              );
                            } else {
                              showSnackbar('Please enter all the details', context);
                            }
                          },
                        ),
                      ],
                    ),
                    mSpacer(mHeight: 24.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadCertificates() async {
    // Step 2: Create FormData
    final formData = FormData();

    // Step 3: Attach certificate images with indexed keys
    // ignore: unused_local_variable
    int index = 0;
    for (var domain in certificateImages.keys) {
      final file = certificateImages[domain].files.first;
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
    // ✅ Skip API call if no files
    if (formData.files.isEmpty) {
      developer.log('No certificate files to upload, skipping API call.');
      finalSkillData = createSkillList(null);
      final _prefs = sl<PreferencesManager>();
      final user_id = _prefs.getUserId();
      context
          .read<MyProfileBloc>()
          .add(LoadUpdateProfile(user_id ?? '6', finalSkillData));
      return;
    }
    context.read<UploadFileBloc>().add(LoadUploadFile(formData));

    developer.log(
        'For Data of skill\nfields : ${formData.fields}\nfiles : ${formData.files}');
  }

  Map<String, dynamic> createSkillList(List<dynamic>? urls) {
    List<Map<String, dynamic>> skillList = [];

    for (int i = 0; i < selectedDomains.length; i++) {
      final domain = selectedDomains[i];
      final authority = courseCollegeControllers[domain]?.text ?? '';
      final subSkills = selectedSubSkillsPerDomain[domain] ?? [];

      for (int j = 0; j < subSkills.length; j++) {
        final skill = subSkills[j];
        // ✅ Only add valid skills with non-null id and name
        if (skill.id != null && skill.name?.isNotEmpty == true) {
          skillList.add({
            'skill_id': skill.id,
            "skill": skill.name,
            "authority": authority,
          });
        }
      }
    }

    final map = {'skills': skillList, 'certificate_images': urls};
    developer.log('Skill map : $map');
    return map;
  }

// Future<FormData> createParamsForSkill() async {
//   final _prefs = sl<PreferencesManager>();
//   // final user_id = '1';
//   final user_id = _prefs.getUserId() ?? '1';
//   // Step 1: Construct skill list
//   List<Map<String, dynamic>> skillList = [];
//   for (int i = 0; i < selectedDomains.length; i++) {
//     final skill = selectedDomains[i];
//     final authority = courseCollegeControllers[skill]?.text ?? '';
//     skillList.add({
//       // 'skill_id': 1,
//       "skill": skill,
//       "authority": authority,
//     });
//   }
//   // Step 2: Create FormData
//   final formData = FormData();
//   formData.fields
//     ..add(MapEntry('user_id', user_id))
//     ..add(MapEntry('skills', jsonEncode(skillList)));
//   // Step 3: Attach certificate images with indexed keys
//   int index = 0;
//   for (var domain in certificateImages.keys) {
//     final file = certificateImages[domain].files.first;
//     if (file != null) {
//       final fileName = file.path.split('/').last;
//       formData.files.add(
//         MapEntry(
//           'certificate_image_$index',
//           await MultipartFile.fromFile(file.path, filename: fileName),
//         ),
//       );
//       index++;
//     }
//   }
//   developer.log(
//       'For Data of skill\nfields : ${formData.fields}\nfiles : ${formData.files}');
//   return formData;
// }
}
