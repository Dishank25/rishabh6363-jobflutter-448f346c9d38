import 'dart:convert';
import 'dart:developer' as developer show log;

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_bloc.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_event.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_state.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/views/signup_your_preferences_view.dart';
import 'package:job_portal/ui_helper/ui_helper.dart';
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

  /// Domain Skills Drop Down
  final LayerLink _domainLink = LayerLink();
  final GlobalKey _domainFieldKey = GlobalKey();
  OverlayEntry? _domainOverlayEntry;

  List<String> allDomains = [];
  List<String> tempSelectedDomains = [];
  List<String> selectedDomains = [];

  var skillParams = {};
  Map<String, List<String>> subSkillsMap = {};
  Map<String, List<String>> selectedSubSkillsPerDomain = {};
  final Map<String, TextEditingController> courseCollegeControllers = {};
  Map<String, dynamic> certificateImages = {};

  void _showDomainDropdown(
      BuildContext context, TextEditingController controller) {
    final renderBox =
        _domainFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    // context.read<DomainBloc>().add(FetchDomains());

    _domainOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _domainLink,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            // child: BlocBuilder<DomainBloc, DomainState>(
            //   builder: (context, state) {
            //     if (state is DomainLoading) {
            //       return const Padding(
            //         padding: EdgeInsets.all(12),
            //         child: Center(child: CircularProgressIndicator()),
            //       );
            //     } else if (state is DomainLoaded) {
            //       return ListView(
            //         shrinkWrap: true,
            //         padding: EdgeInsets.zero,
            //         children: state.domains.map((domain) {
            //           return ListTile(
            //             dense: true,
            //             visualDensity: VisualDensity(vertical: -3),
            //             title: Text(domain.domainName),
            //             onTap: () {
            //               controller.text = domain.domainName;

            //               // Trigger related skills fetch
            //               context
            //                   .read<RelatedSkillsBloc>()
            //                   .add(FetchRelatedSkills(domain.domainName));

            //               _domainOverlayEntry?.remove();
            //               _domainOverlayEntry = null;
            //             },
            //           );
            //         }).toList(),
            //       );
            //     } else if (state is DomainError) {
            //       return Padding(
            //         padding: const EdgeInsets.all(12),
            //         child: Text(state.message),
            //       );
            //     }
            //     return const SizedBox.shrink();
            //   },
            // ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_domainOverlayEntry!);
  }

  @override
  void dispose() {
    // Ensure any active overlay is removed to prevent _dependents assertion error
    _domainOverlayEntry?.remove();
    _domainOverlayEntry = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // _loadToken();

    final skills = _prefs.getSkillParams();
    if (skills != null) {
      skillParams = jsonDecode(skills);
      developer.log('These are skill params : $skillParams');
      setState(() {
        selectedDomains =
            List<String>.from(skillParams['selectedDomains'] ?? []);
        // for (int i = 0; i < selectedDomains.length; i++) {
        //   context.read<SkillBloc>().add(LoadSubSkills(selectedDomains[i]));
        // }
        // to call subskills
        tempSelectedDomains = selectedDomains;

        selectedSubSkillsPerDomain =
            (skillParams['selectedSubSkillsPerDomain'] as Map<String, dynamic>)
                .map(
          (key, value) => MapEntry(
            key,
            List<String>.from(value),
          ),
        );
      });
    }
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
    bloc.add(const LoadDomains());

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
    // if (token == null) {
    //   return const Scaffold(
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: IconButton(
            onPressed: () async {
              await cacheSkills();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// HEADER
              Text(
                "Logo",
                style: mTextStyle15(
                  mColor: Color(0xff032466),
                  mFontWeight: FontWeight.w700,
                ),
              ),
              mSpacer17(),
              Container(
                height: 42,
                width: double.infinity,
                child: Text(
                  "Your Skills",
                  style: mTextStyle32(mColor: Color(0xff1A1C1E)),
                ),
              ),
              Text(
                "Help us match you with the best career opportunities",
                style: mTextStyle12(),
              ),
              mSpacer(mHeight: 25.0),
              const SizedBox(height: 3),
              mSpacer(mHeight: 25.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Areas of Interest", style: mTextStyle14()),
                  BlocListener<SkillBloc, SkillState>(
                    listener: (context, state) {
                      if (state is SkillStateDomainLoaded) {
                        // if ()
                        setState(() {
                          allDomains = state.domainAllResponse.domains;
                        });
                      } else if (state is SubSkillLoaded) {
                        final data = state.subSkillResponse;
                        final domain = state.domain;

                        if (!subSkillsMap.containsKey(domain)) {
                          setState(() {
                            subSkillsMap[domain] = data.skills;
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
                      child: CustomAutocomplete(
                        options: allDomains,
                        label: 'Select Area of interest',
                        onSelected: (value) {
                          if (!selectedDomains.contains(value)) {
                            context.read<SkillBloc>().add(LoadSubSkills(value));
                            setState(() {
                              selectedDomains.add(value);
                              _autoCompleteKey = UniqueKey();
                            });
                          } else {
                            showSnackbar('Skill already selected.', context);
                            setState(() {
                              _autoCompleteKey = UniqueKey();
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  // BlocBuilder<SkillBloc, SkillState>(
                  //   builder: (context, state) {
                  //     if (state is SkillStateDomainLoaded) {
                  //       final data = state.domainAllResponse;
                  //       return CustomAutocomplete(
                  //         options: data.domains,
                  //         label: 'Select Area of interest',
                  //         onSelected: (value) {
                  //           context.read<SkillBloc>().add(LoadSubSkills(value));
                  //           setState(() {
                  //             selectedDomains.add(value);
                  //           });
                  //         },
                  //       );
                  //     } else {
                  //       return Center(
                  //         child: Text('Unhandeled State : $state'),
                  //       );
                  //     }
                  //   },
                  // ),
                  mSpacer(mHeight: 16.0),
                  // CompositedTransformTarget(
                  //   link: _domainLink,
                  //   child: CustomTextField(
                  //     key: _domainFieldKey,
                  //     controller: skillsSearchController,
                  //     hintText: "Select Area of Interest",
                  //     suffixIcon: Icons.search,
                  //     onSuffixTap: () {
                  //       if (_domainOverlayEntry == null) {
                  //         _showDomainDropdown(context, skillsSearchController);
                  //       } else {
                  //         _domainOverlayEntry?.remove();
                  //         _domainOverlayEntry = null;
                  //       }
                  //     },
                  //   ),
                  // ),
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
                              // context.read<SkillBloc>().add(PickImages());
                              // developer.log('Upload certificate tap.');
                              if (domain.isNotEmpty) {
                                // developer.log('Upload certificate tap.1');
                                // Only allow if one skill is selected
                                // final skill = selectedSkills.length == 1
                                //     ? selectedSkills.first
                                //     : null;
                                final skill = domain;
                                developer.log('Skill : $skill');
                                if (skill != null) {
                                  context
                                      .read<SkillBloc>()
                                      .add(PickCertificate(skillName: skill));
                                } else {
                                  // show snackbar or dialog to tell user to select only one
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Please select only one skill to upload certificate.')),
                                  );
                                }
                              }
                            },
                            onCrossTap: () {
                              setState(() {
                                courseCollegeControllers.remove(domain);
                                // remove the certificate for this skill too
                                context
                                    .read<SkillBloc>()
                                    .add(RemoveCertificate(skillName: domain));
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

                  // mSpacer(mHeight: 16.0),
                  // preferenceContainer(
                  //   cName: "Digital Marketing",
                  //   onTap: () {},
                  // ),
                  // mSpacer(),
                  // preferenceContainer(
                  //   cName: "Graphic Design",
                  //   onTap: () {},
                  // ),
                  // mSpacer17(),
                  // Text("Related skills you might know", style: mTextStyle12()),
                  // SizedBox(height: 10),
                  // BlocBuilder<RelatedSkillsBloc, RelatedSkillsState>(
                  //   builder: (context, state) {
                  //     if (state is RelatedSkillsLoading) {
                  //       return Center(child: CircularProgressIndicator());
                  //     } else if (state is RelatedSkillsLoaded) {
                  //       return Wrap(
                  //         spacing: 8,
                  //         runSpacing: 8,
                  //         children: state.skills.map((skill) {
                  //           return courseName(
                  //             name: skill.skillName,
                  //             mIcon: Icons.add,
                  //           );
                  //         }).toList(),
                  //       );
                  //     } else if (state is RelatedSkillsError) {
                  //       return Text(state.message,
                  //           style: TextStyle(color: Colors.red));
                  //     }
                  //     return SizedBox.shrink();
                  //   },
                  // ),
                  // SizedBox(height: 6),
                  // courseName(
                  //     name: "See More",
                  //     mIcon: Icons.add,
                  //     bgColor: Color(0xff1961F3)),
                  mSpacer(mHeight: 24.0),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xff6C7278)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.arrow_back, size: 16),
                              Text("Back", style: mTextStyle14()),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      nextButton(
                        title: "Next",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final skillData = await createParamsForSkill();
                            context
                                .read<SkillBloc>()
                                .add(SubmitSkills(skillData));
                            _prefs.clear(PreferencesManager.SKILL_PARAMS);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPageYourPreferences(
                                  params: widget.params,
                                  /* firstName:
                                  surName:
                                  gender:
                                  DOB:
                                  phoneNumber:
                                  email:
                              jobPreferenceLocation:
                              currentLocation:
                               userCategory:
                               totalWorkExp:
                               currentJobRole:
                              currentCompany:
                               jobStartYear:
                               jobEndYear:
                             studentClass:
                             course:
                             CollegeName:
                              Specialization:
                                  courseStartYear:
                                   courseEndYear:*/
                                ),
                              ),
                            );
                          } else {
                            showSnackbar(
                                'Please enter all the details', context);
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
    );
  }

  Future<FormData> createParamsForSkill() async {
    final _prefs = sl<PreferencesManager>();
    final userId = _prefs.getUserId() ?? '1';

    // Step 1: Construct skill list
    List<Map<String, dynamic>> skillList = [];

    for (int i = 0; i < selectedDomains.length; i++) {
      final skill = selectedDomains[i];
      final authority = courseCollegeControllers[skill]?.text ?? '';

      skillList.add({
        "skill": skill,
        "authority": authority,
      });
    }

    // Step 2: Create FormData
    final formData = FormData();

    formData.fields
      ..add(MapEntry('user_id', userId))
      ..add(MapEntry('skills', jsonEncode(skillList)));

    // Step 3: Attach certificate images with indexed keys
    int index = 0;
    for (var domain in certificateImages.keys) {
      final file = certificateImages[domain].files.first;
      if (file != null) {
        final fileName = file.path.split('/').last;
        formData.files.add(
          MapEntry(
            'certificate_image_$index',
            await MultipartFile.fromFile(file.path, filename: fileName),
          ),
        );
        index++;
      }
    }

    developer.log(
        'For Data of skill\nfields : ${formData.fields}\nfiles : ${formData.files}');

    return formData;
  }
}
