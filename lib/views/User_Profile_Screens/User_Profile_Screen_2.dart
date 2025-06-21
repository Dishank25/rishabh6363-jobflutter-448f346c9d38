import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../ui_helper/ui_helper.dart';
import '../../user_authentication_and_approval_screens/User_Auth_Screen.dart';
import '../../user_authentication_and_approval_screens/User_Education_Approval_Screen.dart';
import '../../user_authentication_and_approval_screens/User_Experience_Approval_Screen.dart';
import '../../user_authentication_and_approval_screens/User_Skills_Approval_Screen.dart';
import 'User_Notifications_Screen.dart';
import 'User_messages_screen.dart';

class UserProfileScreen2 extends StatefulWidget {
  final VoidCallback? onBack;
  UserProfileScreen2({this.onBack});

  @override
  State<UserProfileScreen2> createState() => _UserProfileScreen2State();
}

class _UserProfileScreen2State extends State<UserProfileScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// APP HEADING
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagesScreen()));
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
                      builder: (context) => NotificationsScreen()));
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
            Text(
              "Aman Gupta",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text("Aman@gmail.com",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: mTextStyle12(mColor: Color(0xff544C4C)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Hi, I am Aman working as a designer from 3 years...",
                      style: mTextStyle12(
                        mColor: Color(0xff9095A0),
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Text(
                            "View/",
                            style:
                                mTextStyle12(mColor: AppColors.blueTextColor),
                          )),
                      InkWell(
                          onTap: () {},
                          child: Text("Edit About",
                              style: mTextStyle12(
                                  mColor: AppColors.blueTextColor))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Career Objective",
                    style: mTextStyle12(mColor: Color(0xff544C4C)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("lorem ipsum",
                      style: mTextStyle12(
                        mColor: Color(0xff9095A0),
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Text(
                            "View/",
                            style:
                                mTextStyle12(mColor: AppColors.blueTextColor),
                          )),
                      InkWell(
                          onTap: () {},
                          child: Text("Edit ",
                              style: mTextStyle12(
                                  mColor: AppColors.blueTextColor))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Resume",
                    style: mTextStyle12(mColor: Color(0xff544C4C)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Text(
                            "View/",
                            style:
                                mTextStyle12(mColor: AppColors.blueTextColor),
                          )),
                      InkWell(
                          onTap: () {},
                          child: Text("Edit ",
                              style: mTextStyle12(
                                  mColor: AppColors.blueTextColor))),
                    ],
                  ),
                  profileSection(
                    title: "Skills",
                    items: ["Digital Marketing", "Sales", "UI design", "SEO"],
                    onEditTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserSkillsApprovalScreen()));
                    },
                    editText: "Add Skills",
                  ),
                  profileSection(
                    title: "Work Experience",
                    items: ["Microsoft", "Startup", "Google"],
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
                    items: ["English", "Hindi", "Spanish"],
                    onEditTap: () {},
                    editText: "Add Language",
                  ),
                  profileSection(
                    title: "Authentication",
                    items: ["Email", "Phone No.", "Aadhar"],
                    onEditTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserAuthScreen()));
                    },
                    editText: "Get Verified",
                    isGetVerified:
                        true, // Only show "Get Verified" without "Edit/"
                  ),
                ],
              ),
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
  bool isGetVerified = false, // for special case like "Get Verified"
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 15),
      Text(title, style: mTextStyle12(mColor: Color(0xff544C4C))),
      SizedBox(height: 3),
      Wrap(
        spacing: 11,
        runSpacing: 8,
        children: items.map((item) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle,
                  color: item == items.first ? Colors.green : Colors.red,
                  size: 6),
              SizedBox(width: 3),
              Text(item, style: mTextStyle12(mColor: Color(0xff9095A0))),
            ],
          );
        }).toList(),
      ),
      SizedBox(height: 3),
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
