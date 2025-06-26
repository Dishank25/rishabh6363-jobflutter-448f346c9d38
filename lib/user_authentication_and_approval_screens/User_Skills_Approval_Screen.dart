import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/ui_helper/ui_helper.dart';
import 'package:job_portal/widgets/widgets.dart';

class UserSkillsApprovalScreen extends StatelessWidget {
  TextEditingController skillSearchController = TextEditingController();
  TextEditingController _1Controller = TextEditingController();
  TextEditingController _2Controller = TextEditingController();
  TextEditingController _3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Text(
                "Your Skills",
                style: mTextStyle32(mColor: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: skillSearchController,
                hintText: "List Your Skills here...",
                suffixIcon: Icons.search,
                fillColor: Colors.white,
              ),
              SizedBox(
                height: 16,
              ),
              preferenceContainer(
                  cName: "Digital Marketing",
                  cIcon: Icons.cancel,
                  onTap: () {},
                  courseCollegeController: _1Controller),
              SizedBox(
                height: 16,
              ),
              Text(
                "Related skills you might know",
                style: mTextStyle12(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  courseName(
                    name: "SEO",
                    mIcon: Icons.add,
                  ),
                  Spacer(),
                  courseName(name: "Content Writing", mIcon: Icons.add),
                  Spacer(),
                  courseName(name: "Digital Marketing", mIcon: Icons.add),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              courseName(
                  name: "See More",
                  mIcon: Icons.add,
                  bgColor: Color(0xff1961F3)),
              mSpacer(mHeight: 24.0),
              preferenceContainer(
                  cName: "Python",
                  cIcon: Icons.cancel,
                  onTap: () {},
                  courseCollegeController: _2Controller),
              Text(
                "Related skills you might know",
                style: mTextStyle12(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  courseName(name: "SEO", mIcon: Icons.add, onTap: () {}),
                  Spacer(),
                  courseName(
                      name: "Content Writing", mIcon: Icons.add, onTap: () {}),
                  Spacer(),
                  courseName(
                      name: "Digital Marketing",
                      mIcon: Icons.add,
                      onTap: () {}),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              courseName(
                  name: "See More",
                  mIcon: Icons.add,
                  bgColor: Color(0xff1961F3),
                  onTap: () {}),
              mSpacer(mHeight: 24.0),
              preferenceContainer(
                  cName: "Python",
                  cIcon: Icons.cancel,
                  onTap: () {},
                  courseCollegeController: _3Controller,
                  bgColor: Color(0xffFFF6E4)),
              SizedBox(
                height: 24,
              ),
              Center(child: nextButton(title: "Save Changes", onTap: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
