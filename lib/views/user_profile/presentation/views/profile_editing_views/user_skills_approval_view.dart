import 'dart:developer' as developer show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/ui_helper/ui_helper.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_bloc.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_event.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_state.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_bloc.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_state.dart';
import 'package:job_portal/widgets/widgets.dart';

class UserSkillsApprovalScreen extends StatefulWidget {
  const UserSkillsApprovalScreen({super.key});

  @override
  State<UserSkillsApprovalScreen> createState() =>
      _UserSkillsApprovalScreenState();
}

class _UserSkillsApprovalScreenState extends State<UserSkillsApprovalScreen> {
  TextEditingController skillSearchController = TextEditingController();
  TextEditingController _1Controller = TextEditingController();
  TextEditingController _2Controller = TextEditingController();
  TextEditingController _3Controller = TextEditingController();

  Key _autoCompKey = UniqueKey();

  List<String> domains = [];

  List<String> selectedSkills = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    context.read<SkillBloc>().add(LoadDomains());
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
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocListener<SkillBloc, SkillState>(
                listener: (context, state) {
                  if (state is SkillStateDomainLoaded) {
                    final data = state.domainAllResponse;
                    setState(() {
                      domains = data.domains;
                    });
                    developer.log("Loaded domains");
                  } else if (state is SkillStateDomainError) {
                    developer.log("Error in loading domains");
                  } else if (state is SkillStateDomainLoading) {
                    developer.log("Loading domains");
                  }
                },
                child: SizedBox(),
              ),
              Text(
                "Your Skills",
                style: mTextStyle32(mColor: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              // CustomTextField(
              //   controller: skillSearchController,
              //   hintText: "List Your Skills here...",
              //   suffixIcon: Icons.search,
              //   fillColor: Colors.white,
              // ),
              Container(
                key: _autoCompKey,
                child: CustomAutocomplete(
                  options: domains,
                  label: "List Your Skills here...",
                  onSelected: (value) {
                    if (!selectedSkills.contains(value)) {
                      setState(() {
                        selectedSkills.add(value);
                        _autoCompKey = UniqueKey();
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: selectedSkills.length,
                  itemBuilder: (context, index) {
                    final domain = selectedSkills[index];
                    final controller = TextEditingController();
                    return Column(
                      children: [
                        preferenceContainer(
                          cName: domain,
                          cIcon: Icons.cancel,
                          onTap: () {},
                          onCrossTap: () {
                            setState(() {
                              selectedSkills.removeAt(index);
                            });
                          },
                          courseCollegeController: controller,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    );
                  }),
              // preferenceContainer(
              //   cName: "Digital Marketing",
              //   cIcon: Icons.cancel,
              //   onTap: () {},
              //   courseCollegeController: _1Controller,
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // Text(
              //   "Related skills you might know",
              //   style: mTextStyle12(),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     courseName(
              //       name: "SEO",
              //       mIcon: Icons.add,
              //     ),
              //     Spacer(),
              //     courseName(name: "Content Writing", mIcon: Icons.add),
              //     Spacer(),
              //     courseName(name: "Digital Marketing", mIcon: Icons.add),
              //   ],
              // ),
              // SizedBox(
              //   height: 6,
              // ),
              // courseName(
              //     name: "See More",
              //     mIcon: Icons.add,
              //     bgColor: Color(0xff1961F3)),
              // mSpacer(mHeight: 24.0),
              // preferenceContainer(
              //     cName: "Python",
              //     cIcon: Icons.cancel,
              //     onTap: () {},
              //     courseCollegeController: _2Controller),
              // Text(
              //   "Related skills you might know",
              //   style: mTextStyle12(),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     courseName(name: "SEO", mIcon: Icons.add, onTap: () {}),
              //     Spacer(),
              //     courseName(
              //         name: "Content Writing", mIcon: Icons.add, onTap: () {}),
              //     Spacer(),
              //     courseName(
              //         name: "Digital Marketing",
              //         mIcon: Icons.add,
              //         onTap: () {}),
              //   ],
              // ),
              // SizedBox(
              //   height: 6,
              // ),
              // courseName(
              //     name: "See More",
              //     mIcon: Icons.add,
              //     bgColor: Color(0xff1961F3),
              //     onTap: () {}),
              // mSpacer(mHeight: 24.0),
              // preferenceContainer(
              //     cName: "Python",
              //     cIcon: Icons.cancel,
              //     onTap: () {},
              //     courseCollegeController: _3Controller,
              //     bgColor: Color(0xffFFF6E4)),
              const SizedBox(
                height: 24,
              ),
              BlocListener<MyProfileBloc, MyProfileState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is UpdateProfileLoaded) {
                    developer.log('Skills updated');
                    Navigator.pop(context);
                  } else if (state is UpdateProfileLoading) {
                    developer.log('Skills updating please wait');
                  } else if (state is UpdateProfileLoaded) {
                    developer.log(
                        'Encountered some issue while updating skills. Please try again');
                    showSnackbar(
                        'Encountered some issue while updating skills. Please try again',
                        context);
                  }
                },
                child: Center(
                  child: SizedBox(
                    width: 150,
                    child: nextButton(
                      title: "Save Changes",
                      onTap: () {
                        if (selectedSkills.isNotEmpty) {
                          final map = {'skills': selectedSkills};
                          final _prefs = sl<PreferencesManager>();
                          final userId = _prefs.getUserId();
                          context
                              .read<MyProfileBloc>()
                              .add(LoadUpdateProfile(userId ?? '2', map));
                        } else {
                          showSnackbar("No skills selected", context);
                        }
                      },
                    ),
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
