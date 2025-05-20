import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/Screens/User_Profile_Screens/User_Notifications_Screen.dart';
import 'package:job_portal/Screens/User_Profile_Screens/User_change_email_screen.dart';
import 'package:job_portal/Screens/User_Profile_Screens/User_change_password_screen.dart';
import 'package:job_portal/Screens/User_Profile_Screens/User_messages_screen.dart';
import 'package:job_portal/Screens/User_Profile_Screens/User_terms_conditions_screen.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../Bottom_Nav_Bar/Student_Bottom_Nav_Bar.dart';
import 'User_Profile_Screen_2.dart';
import 'User_my_applications.dart';

class UserProfileScreen_1 extends StatefulWidget {
 final showUserProfile2;
 final VoidCallback ? onCallBackFromProfileScreen2;

 UserProfileScreen_1({this.showUserProfile2=false, this.onCallBackFromProfileScreen2});

  @override
  State<UserProfileScreen_1> createState() => _UserProfileScreen_1State();
}

class _UserProfileScreen_1State extends State<UserProfileScreen_1> {

  bool _isHelpSupportOpened = false;
  bool _isManageAccountOpened = false;

  @override
  Widget build(BuildContext context) {
    if(widget.showUserProfile2){
      return UserProfileScreen2(
        onBack: widget.onCallBackFromProfileScreen2,);
    }

    return Scaffold(
      /// APP HEADING
      appBar: AppBar(
      leading: InkWell(onTap: (){},child: Icon(Icons.arrow_back),),
      actions: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MessagesScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset("assets/Icons/message_icon.svg"),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset("assets/Icons/notifications_icon.svg"),
          ),
        ),
      ],
    ),
      /// BODY PART
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              /// Profile Container
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.mainColor
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: SvgPicture.asset("assets/Icons/profile_icon.svg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Aman",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white ),),
                          Text("Aman@gmail.com", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white ))
                        ],
                      ),
                    ),
                ]
              ),
              ),
              SizedBox(height: 18,),
              Container(
                height: 580,
                width: 383,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 18.0 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UserProfileEnteries(
                          mIcon: "assets/Icons/profile_in_circle.svg", 
                          title: "My Profile", desc: "Make Changes to my Profile",
                          mArrow: Icons.keyboard_arrow_right_outlined, 
                          onTap: (){
                              if(widget.onCallBackFromProfileScreen2!=null){
                                widget.onCallBackFromProfileScreen2!();
                              }
                          }),
                      UserProfileEnteries(mIcon: "assets/Icons/application_icon.svg", title: "My Applications", desc: "Manage your Applications",mArrow: Icons.keyboard_arrow_right_outlined,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>student_job_applications()));
                      }
                      ),

                      UserProfileEnteries(
                          mIcon: "assets/Icons/notification_in_circle.svg",
                          title: "Terms and Conditions",
                          mArrow: Icons.keyboard_arrow_right_outlined,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserTermsConditionsScreen()));
                      }),

                      UserProfileEnteries(mIcon: "", title: "Help & Support",mArrow: Icons.keyboard_arrow_right_outlined, onTap: (){
                        setState(() {
                          _isHelpSupportOpened =!_isHelpSupportOpened;
                        });
                     //   Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                      }),
                      if(_isHelpSupportOpened)...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            children: [
                              UserProfileEnteries(mIcon: "assets/Icons/Manage_account_icons.svg", title: "Raise your ticket"),
                              UserProfileEnteries(mIcon: "assets/Icons/Manage_account_icons.svg", title: "Chat with us!"),
                            ],
                          ),
                        )
                      ],
                      UserProfileEnteries(mIcon: "assets/Icons/Manage_account_icons.svg", title: "Manage Account",mArrow: Icons.keyboard_arrow_right_outlined, onTap: (){
                        setState(() {
                          _isManageAccountOpened = !_isManageAccountOpened;
                        });
                      }),
                      if(_isManageAccountOpened)...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            children: [
                              UserProfileEnteries(
                                  mIcon: "assets/Icons/Manage_account_icons.svg",
                                  title: "Change email",
                                   onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserChangeEmailPage()));
                                  } ),

                              UserProfileEnteries(
                                  mIcon: "assets/Icons/Manage_account_icons.svg",
                                  title: "Change password",
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserChangePasswordScreen()));
                              }),
                              UserProfileEnteries(mIcon: "assets/Icons/Manage_account_icons.svg", title: "Delete my account")
                            ],
                          ),
                        )
                      ],
                      UserProfileEnteries(mIcon: "assets/Icons/Log_out_icon.svg", title: "Log Out", desc: "Further secure your account for safety", mArrow: Icons.keyboard_arrow_right_outlined)
                    ],
                  ),
                ),
        
              )
            ],
          ),
          ),
      ),
      );
  }
}


/// Widget for entries of the profile column
Widget UserProfileEnteries({required String mIcon, required String title, String ? desc,IconData? mArrow, VoidCallback ? onTap}){
  return Row(
    children: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(mIcon),
      ),
      SizedBox(width: 16,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
            Text(desc ?? "",style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),)
          ],
        ),
      ),
      IconButton(onPressed: onTap, icon: Icon(mArrow))
    ],
  );
}
