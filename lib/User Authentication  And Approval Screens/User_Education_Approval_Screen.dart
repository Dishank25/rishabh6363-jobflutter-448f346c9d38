import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../UI_Helper/UI_Helper.dart';
import '../Widgets/widgets.dart';

class UserEducationApprovalScreen extends StatelessWidget {

  TextEditingController collController = TextEditingController();
  TextEditingController searchOutController = TextEditingController();
  TextEditingController cStartYearController = TextEditingController();
  TextEditingController cEndYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/message_icon.svg"),
            ),
          ),
          InkWell(
            onTap: (){},
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
                 Text("Your Education", style: mTextStyle32(mColor: Colors.black),),
                SizedBox(height: 10,),
                  CustomTextField(controller:searchOutController , hintText: "Select your course",suffixIcon: Icons.search, fillColor: Colors.white,),
                  SizedBox(height: 24,),
                  Container(
                    height: 285,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF6E4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              courseName(name: "B.tech", bgColor: Color(0xff1961F3), mIcon: Icons.add, onTap: (){}),
                              Spacer(),
                              courseName(name: "View/Edit Certificate", onTap: (){})
                            ],
                          ),
                          SizedBox(height: 4,),
                          Text("College Name", style: mTextStyle12(),),
                          CustomTextField(controller:collController , hintText: "Delhi Technological University", fillColor: Colors.white,),
                         SizedBox(height: 4,),
                          Text("Specialization", style: mTextStyle12(),),
                          SizedBox(height: 4,),
                          CustomTextField(controller: courseCollegeController, hintText: "Eg.Computer Science", fillColor: Colors.white,suffixIcon: Icons.arrow_drop_down,),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              Text("Start Year", style: mTextStyle12(),),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 110.0),
                                child: Text("End Year",style: mTextStyle12(),),
                              ),
                            ],
                          ),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              SizedBox(
                                width: 165,
                                  child: CustomTextField(controller: cStartYearController , hintText: "Choose Year", suffixIcon: Icons.arrow_drop_down, fillColor: Colors.white, onSuffixTap: (){},)),
                             Spacer(),
                              SizedBox(
                                  width: 165,
                                  child: CustomTextField(controller: collController, hintText: "Choose Year", suffixIcon: Icons.arrow_drop_down, fillColor: Colors.white, onSuffixTap: (){},)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Center(child: nextButton(title: "Save Changes", onTap: (){}))
          ]
    )
        )
        )
    );
  }
}
