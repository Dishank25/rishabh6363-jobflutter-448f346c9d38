import 'package:flutter/material.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import 'SignUp_Page_Your_Skills.dart';

class SignupAsAnyOne extends StatefulWidget {


  @override
  State< SignupAsAnyOne> createState() => _SignInPageUniversityStudentState();
}

class _SignInPageUniversityStudentState extends State< SignupAsAnyOne> {

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// HEADER
              Text("Logo", style: mTextStyle15(mColor: Color(0xff032466), mFontWeight: FontWeight.w700),),
              mSpacer17(),
              Container(
                height: 84,
                width: double.infinity,
                child:Text("Let's get started! ", style: mTextStyle32(mColor:Color(0xff1A1C1E)),),
              ),
              mSpacer17(),
              mSpacer(mHeight: 26.0),

              /// BODY PART
              Row(
                children: [
                  Expanded(child: Text("First Name", style: mTextStyle12(),)),
                  SizedBox(width: 12,),
                  Expanded(child: Text("Last Name", style: mTextStyle12(),))
                ],
              ),
              mSpacer(mHeight: 2.0),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: firstnameController, hintText: "Aman"),
                  ),
                  SizedBox(width:   12.0,),
                  Expanded(
                    child: CustomTextField(
                        controller: surnameController, hintText: "Gupta"),
                  ),
                ],
              ),
              mSpacer17(),
              Text("Email"),
              mSpacer(mHeight: 2.0),
              CustomTextField(controller: emailController, hintText: "amangupta@gmail.com"),
              mSpacer17(),
              Text("Phone Number", style: mTextStyle12(),),
              CustomTextField(controller: phoneController, hintText: ""),
              mSpacer17(),
              Text("Date of Birth", style: mTextStyle12(),),
              CustomTextField(controller: DOBController, hintText: "", suffixIcon: Icons.calendar_month, ),
              mSpacer17(),
              Text("Current City", style: mTextStyle12(),),
              CustomTextField(controller: cityController, hintText: ""),
              mSpacer17(),
              Text("Gender", style: mTextStyle12(),),
              CustomTextField(controller: genderController, hintText: "", suffixIcon: Icons.keyboard_arrow_down_outlined,),
              mSpacer17(),
              Text("Type", style: mTextStyle12(),),
              Row(
                children: [
                  OptionContainer(
                      title: "School Student",
                      imgPath: "assets/Icons/school_student.svg",
                  isSelected: selectedOption== "School Student",
                  onTap: (){
                        setState(() {
                          selectedOption = "School Student";
                        });
                  }
                  ),
                  SizedBox(width: 12,),
                  OptionContainer(
                      title:"College Student" ,
                      imgPath: "assets/Icons/College_Student.svg",
                      isSelected: selectedOption== "College Student",
                      onTap: (){
                        setState(() {
                          selectedOption = "College Student";
                        });
                      }
                  ),
                  SizedBox(width: 12,),
                  OptionContainer(title: "Fresher", imgPath:"assets/Icons/fresher_icon.svg",
                      isSelected: selectedOption== "Fresher",
                      onTap: (){
                        setState(() {
                          selectedOption = "Fresher";
                        });
                      }
                  ),
                ],
              ),
              SizedBox(height: 3,),
              OptionContainer( title: "Working Professional",
                  imgPath: "assets/Icons/working-professional.svg",
                  isSelected: selectedOption== "Working Professional",
                  onTap: (){
                    setState(() {
                      selectedOption = "Working Professional";
                    });
                  }),
              mSpacer(mHeight: 25.0),
              if(selectedOption=="School Student")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Standard", style: mTextStyle12(),),
                  Row(
                    children: [
                      OptionContainer(title: "Class XII", imgPath: ""),
                      SizedBox(width: 12,),
                      OptionContainer( title:"Class XI", imgPath: "" ),
                      SizedBox(width: 12,),
                      OptionContainer( title: "Class X or below", imgPath: "" ),


                    ],
                  ),
                  mSpacer(mHeight: 25.0),
                ],
              ),
              if(selectedOption=="College Student" || selectedOption=="Fresher")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Course", style: mTextStyle12(),),
                    Padding(
                      padding: const EdgeInsets.only(right: 11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OptionContainer( title: "B.Tech", ),
                          SizedBox(width: 12,),
                          OptionContainer( title:"BE", ),
                          SizedBox(width: 12,),
                          OptionContainer(title: "B.com",  ),
                          SizedBox(width: 12,),
                          OptionContainer( title:"MBA",  ),
                          SizedBox(width: 12,),
                          OptionContainer(title: "BA", ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3,),
                    Padding(
                      padding: const EdgeInsets.only(right: 11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OptionContainer( title: "M.Tech", imgPath: ""),
                            SizedBox(width: 12,),
                            OptionContainer( title:"MCA", imgPath: "" ),
                            SizedBox(width: 12,),
                            OptionContainer( title: "Diploma", imgPath: "" ),
                            SizedBox(width: 12,),

                          ]
                      ),
                    ),
                    SizedBox(height: 6,),
                    OptionContainer(/*mHeight: 32, mWidth: 120,*/ title: "Add your Course +", imgPath: "" ),
                    mSpacer(mHeight: 25.0),
                    Text("College Name", style: mTextStyle12(),),
                    CustomTextField(controller: collegeController, hintText:"College Name", suffixIcon: Icons.keyboard_arrow_down_outlined ,),
                    mSpacer17(),
                    Text("Specialization", style: mTextStyle12(),),
                    CustomTextField(controller:specializationController, hintText:"Eg. Computer Science", suffixIcon: Icons.keyboard_arrow_down_outlined ,),
                    mSpacer17(),
                    Row(
                      children: [
                        Text("Start Year", style: mTextStyle12(),),
                        SizedBox(width: 135,),
                        Text("End Year", style: mTextStyle12(),)
                      ],
                    ),
                    mSpacer(mHeight: 2.0),
                    Row(
                      children: [
                        SizedBox(
                            width: 165,
                            child: CustomTextField(
                              controller: startYearController, hintText: "Choose Year", suffixIcon:Icons.keyboard_arrow_down_outlined  ,)),
                        SizedBox(width: 30.0,),
                        SizedBox(
                            width: 165,
                            child: CustomTextField(
                              controller:endYearController, hintText: "Choose Year", suffixIcon: Icons.keyboard_arrow_down_outlined ,)),
                      ],
                    ),
                    mSpacer(mHeight: 25.0),
                  ],
                ),
              if(selectedOption=="Working Professional")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Course", style: mTextStyle12(),),
                    Padding(
                      padding: const EdgeInsets.only(right: 11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OptionContainer( title: "B.Tech", ),
                          SizedBox(width: 12,),
                          OptionContainer( title:"BE", ),
                          SizedBox(width: 12,),
                          OptionContainer(title: "B.com",  ),
                          SizedBox(width: 12,),
                          OptionContainer( title:"MBA",  ),
                          SizedBox(width: 12,),
                          OptionContainer(title: "BA", ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3,),
                    Padding(
                      padding: const EdgeInsets.only(right: 11.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OptionContainer( title: "M.Tech", imgPath: ""),
                            SizedBox(width: 12,),
                            OptionContainer( title:"MCA", imgPath: "" ),
                            SizedBox(width: 12,),
                            OptionContainer( title: "Diploma", imgPath: "" ),
                            SizedBox(width: 12,),

                          ]
                      ),
                    ),

                    mSpacer17(),
                    Row(
                      children: [
                        Text("Total Work Experience ", style: mTextStyle12(),),
                        Text("*", style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    CustomTextField(controller: TWXController, hintText:"Select Experience", suffixIcon: Icons.keyboard_arrow_down_outlined ,),
                    mSpacer17(),
                    Row(
                      children: [
                        Text("Current Job Role", style: mTextStyle12(),),
                        Text("*", style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    CustomTextField(controller:jobRoleController, hintText:"Job Role", suffixIcon: Icons.keyboard_arrow_down_outlined ,),
                    mSpacer17(),
                    Row(
                      children: [
                        Text("Current Company", style: mTextStyle12(),),
                        Text("*", style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    CustomTextField(controller:currentCompany, hintText:"Current Company", suffixIcon: Icons.keyboard_arrow_down_outlined ,),
                    mSpacer17(),
                    Row(
                      children: [
                        Text("Start Year", style: mTextStyle12(),),
                        SizedBox(width: 135,),
                        Text("End Year", style: mTextStyle12(),)
                      ],
                    ),
                    mSpacer(mHeight: 2.0),
                    Row(
                      children: [
                        SizedBox(
                            width: 165,
                            child: CustomTextField(
                              controller: startYearController, hintText: "Choose Year", suffixIcon:Icons.keyboard_arrow_down_outlined  ,)),
                        SizedBox(width: 30.0,),
                        SizedBox(
                            width: 165,
                            child: CustomTextField(
                              controller:endYearController, hintText: "Choose Year", suffixIcon: Icons.keyboard_arrow_down_outlined ,)),
                      ],
                    ),
                    mSpacer17(),
                    Text("Current or Latest annual Salary/CTC ", style: mTextStyle12(),),
                    Text("We will use this to find jobs matching/ exceeding your  current salary range.\nThis information is not visible to employers.", style: TextStyle(fontSize: 9),),
                    SizedBox(height: 2,),
                    CustomTextField(controller: CTCController, hintText: "E.g 4,00,000"),
                    mSpacer(mHeight: 25.0),
                  ],

                ),




              /// END PART
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  nextButton(title: "Next", onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPageYourSkills()));
                  }),
                ],
              ),
              mSpacer(mHeight: 25.0),
            ],
          ),
        ),
      )
    );
  }
}
