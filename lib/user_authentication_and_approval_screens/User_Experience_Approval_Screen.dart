import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../ui_helper/ui_helper.dart';
import '../widgets/widgets.dart';

class UserExperienceApprovalScreen extends StatelessWidget {
  TextEditingController searchJobfieldController = TextEditingController();
  TextEditingController JobProfileController = TextEditingController();
  TextEditingController JobStartDate = TextEditingController();
  TextEditingController jobEndDate = TextEditingController();
  TextEditingController salarryController = TextEditingController();

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
                        "Your Experience",
                        style: mTextStyle32(mColor: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: searchJobfieldController,
                        hintText: "Select your company",
                        suffixIcon: Icons.search,
                        fillColor: Colors.white,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 275,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffDFF7EA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    courseName(
                                        name: "Uber",
                                        bgColor: Color(0xff1961F3),
                                        mIcon: Icons.cancel,
                                        onTap: () {}),
                                    Spacer(),
                                    courseName(
                                        name: "View/Edit Certificate",
                                        onTap: () {})
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Job Role/Profile",
                                  style: mTextStyle12(),
                                ),
                                CustomTextField(
                                  controller: JobProfileController,
                                  hintText: "Digital Marketing",
                                  fillColor: Colors.white,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Start Year",
                                      style: mTextStyle12(),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 110.0),
                                      child: Text(
                                        "End Year",
                                        style: mTextStyle12(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 165,
                                        child: CustomTextField(
                                          controller: JobStartDate,
                                          hintText: "Choose Year",
                                          suffixIcon: Icons.arrow_drop_down,
                                          fillColor: Colors.white,
                                          onSuffixTap: () {},
                                        )),
                                    Spacer(),
                                    SizedBox(
                                        width: 165,
                                        child: CustomTextField(
                                          controller: jobEndDate,
                                          hintText: "Choose Year",
                                          suffixIcon: Icons.arrow_drop_down,
                                          fillColor: Colors.white,
                                          onSuffixTap: () {},
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Current CTC",
                                  style: mTextStyle12(),
                                ),
                                CustomTextField(
                                  controller: salarryController,
                                  hintText: "Eg. 4,00,000",
                                  fillColor: Colors.white,
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child:
                              nextButton(title: "Save Changes", onTap: () {}))
                    ]))));
  }
}
