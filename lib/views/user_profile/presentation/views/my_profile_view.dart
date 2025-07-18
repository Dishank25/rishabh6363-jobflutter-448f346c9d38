import 'dart:developer' as developer show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/injection_container.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_bloc.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_state.dart';
import 'package:job_portal/views/user_profile/presentation/views/choose_your_template_view.dart';
import '../../../../ui_helper/ui_helper.dart';
import '../../../../user_authentication_and_approval_screens/User_Auth_Screen.dart';
import '../../../../user_authentication_and_approval_screens/User_Education_Approval_Screen.dart';
import '../../../../user_authentication_and_approval_screens/User_Experience_Approval_Screen.dart';
import '../../../../user_authentication_and_approval_screens/User_Skills_Approval_Screen.dart';
import 'User_Notifications_Screen.dart';
import 'User_messages_screen.dart';

class UserProfileScreen2 extends StatefulWidget {
  final VoidCallback? onBack;
  const UserProfileScreen2({super.key, this.onBack});

  @override
  State<UserProfileScreen2> createState() => _UserProfileScreen2State();
}

class _UserProfileScreen2State extends State<UserProfileScreen2> {
  var userProfileDetails;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final bloc = context.read<MyProfileBloc>();

    // ignore: unused_local_variable
    final _prefs = sl<PreferencesManager>();

    final userId = _prefs.getUserId();

    bloc.add(LoadMyProfileDetails(userId ?? '6'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APP HEADING
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(onPressed: widget.onBack),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MessagesScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/message_icon.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/notifications_icon.svg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 88,
                width: 64,
                child: SvgPicture.asset("assets/Icons/profile_icon.svg"),
              ),
            ),
            BlocBuilder<MyProfileBloc, MyProfileState>(
              builder: (context, state) {
                if (state is MyProfileDetailsLoaded) {
                  developer.log('MyProfileDetailsLoaded');
                  final data = state.userDetailEntity;

                  return Column(
                    children: [
                      Text(
                        // "Aman Gupta",
                        data.firstName + " " + data.lastName,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                          // "Aman@gmail.com",
                          data.email,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400)),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About",
                              style:
                                  mTextStyle12(mColor: const Color(0xff544C4C)),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                                // "Hi, I am Aman working as a designer from 3 years...",
                                data.aboutUs ??
                                    "Hi, I am Aman working as a designer from 3 years...",
                                style: mTextStyle12(
                                  mColor: const Color(0xff9095A0),
                                )),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "View/",
                                      style: mTextStyle12(
                                          mColor: AppColors.blueTextColor),
                                    )),
                                InkWell(
                                    onTap: () {},
                                    child: Text("Edit About",
                                        style: mTextStyle12(
                                            mColor: AppColors.blueTextColor))),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Career Objective",
                              style:
                                  mTextStyle12(mColor: const Color(0xff544C4C)),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(data.careerObjective ?? "lorem ipsum",
                                style: mTextStyle12(
                                  mColor: const Color(0xff9095A0),
                                )),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "View/",
                                      style: mTextStyle12(
                                          mColor: AppColors.blueTextColor),
                                    )),
                                InkWell(
                                    onTap: () {},
                                    child: Text("Edit ",
                                        style: mTextStyle12(
                                            mColor: AppColors.blueTextColor))),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Resume",
                              style:
                                  mTextStyle12(mColor: const Color(0xff544C4C)),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<MyProfileBloc>()
                                        .add(const PickResume());
                                  },
                                  child: Text(
                                    "View/",
                                    style: mTextStyle12(
                                        mColor: AppColors.blueTextColor),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ChooseYourTemplateScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Edit ",
                                    style: mTextStyle12(
                                      mColor: AppColors.blueTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            profileSection(
                              title: "Skills",
                              items: [
                                "Digital Marketing",
                                "Sales",
                                "UI design",
                                "SEO"
                              ],
                              statusList: [
                                false,
                                false,
                                true,
                                false,
                              ],
                              onEditTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserSkillsApprovalScreen(),
                                  ),
                                );
                              },
                              editText: "Add Skills",
                            ),
                            profileSection(
                              title: "Work Experience",
                              items: ["Microsoft", "Startup", "Google"],
                              // items: data.experiences as List<String>,
                              statusList: [
                                false,
                                false,
                                true,
                              ],
                              onEditTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserExperienceApprovalScreen()));
                              },
                              editText: "Add Work Experience",
                            ),
                            profileSection(
                              title: "Education",
                              items: ["B.Tech", "Diploma", "M.Tech"],
                              statusList: [
                                false,
                                false,
                                true,
                              ],
                              onEditTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserEducationApprovalScreen()));
                              },
                              editText: "Add Education",
                            ),
                            profileSection(
                              title: "Languages you know",
                              // items: ["English", "Hindi", "Spanish"],
                              items: [data.language ?? 'English'],
                              statusList: [
                                true,
                              ],
                              onEditTap: () {},
                              editText: "Add Language",
                            ),
                            profileSection(
                              title: "Authentication",
                              items: ["Email", "Phone No.", "Aadhar"],
                              statusList: [
                                data.isEmailVerified,
                                data.isPhoneVerified,
                                data.isAadhaarVerified,
                              ],
                              onEditTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserAuthScreen()));
                              },
                              editText: "Get Verified",
                              isGetVerified:
                                  true, // Only show "Get Verified" without "Edit/"
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is MyProfileDetailsLoading) {
                  developer.log('MyProfileDetailsLoading');
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('MyProfileDetailsLoading')
                      ],
                    ),
                  );
                } else if (state is MyProfileDetailsError) {
                  developer.log('MyProfileDetailsError');
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('MyProfileDetailsError')
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        const CircularProgressIndicator(),
                        Text('Unhandeled State : $state')
                      ],
                    ),
                  );
                }
              },
              // child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget for common Column
Widget profileSection({
  required String title,
  required List<String> items,
  required VoidCallback onEditTap,
  required String editText,
  bool isGetVerified = false,
  List<bool>? statusList, // nullable list of booleans
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 15),
      Text(title, style: mTextStyle12(mColor: const Color(0xff544C4C))),
      const SizedBox(height: 3),
      Wrap(
        spacing: 11,
        runSpacing: 8,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final status = statusList != null && index < statusList.length
              ? statusList[index]
              : null;

          Color dotColor;
          if (status == true) {
            dotColor = Colors.green;
          } else if (status == false) {
            dotColor = Colors.red;
          } else {
            dotColor = Colors.grey; // default/fallback color
          }

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, color: dotColor, size: 6),
              const SizedBox(width: 3),
              Text(item, style: mTextStyle12(mColor: const Color(0xff9095A0))),
            ],
          );
        }),
      ),
      const SizedBox(height: 3),
      Row(
        children: [
          InkWell(
            onTap: onEditTap,
            child: Text(
              isGetVerified ? editText : "Edit/",
              style: mTextStyle12(mColor: AppColors.blueTextColor),
            ),
          ),
          if (!isGetVerified)
            InkWell(
              onTap: onEditTap,
              child: Text(
                editText,
                style: mTextStyle12(
                    mColor: AppColors.blueTextColor,
                    mFontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
    ],
  );
}
