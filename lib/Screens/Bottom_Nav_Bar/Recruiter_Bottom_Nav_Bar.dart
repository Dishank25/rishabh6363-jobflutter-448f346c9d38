import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_portal/Screens/Recruiter_Profile_Screens/Recruiter_ProfileScreen1.dart';
import 'package:job_portal/Screens/Recruiter_Screens/Recruiter_Dashboard.dart';
import 'package:job_portal/Screens/Recruiter_Screens/Recruiter_feed_Screen.dart';
import 'package:job_portal/UI_Helper/UI_Helper.dart';

import '../Recruiter_Screens/RecruiterApprovalScreen.dart';



class RecruiterBottomNavBar extends StatefulWidget{
  @override
  State<RecruiterBottomNavBar> createState() => _RecruiterBottomNavBarState();
}

class _RecruiterBottomNavBarState extends State<RecruiterBottomNavBar> {
  var selectedIndex = 1;
  @override
  Widget build(BuildContext context) {

    List<Widget> navTo = [
     RecruiterFeedScreen(),
      RecruiterDashboard(),
      RecruiterApprovalScreen(),
      RecruiterProfilescreen1()
    ];
    return Scaffold(
      body: navTo[selectedIndex],
      bottomNavigationBar:BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: SvgPicture.asset("assets/Icons/Feed_Icons.svg", color: (selectedIndex==0)? AppColors.mainRedColor: Colors.white,), label: "Feed", ),
        BottomNavigationBarItem(icon: SvgPicture.asset("assets/Icons/dashboard_icon.svg",color: (selectedIndex==1)? AppColors.mainRedColor: Colors.white,), label: "Dashboard",),
        BottomNavigationBarItem(icon: SvgPicture.asset("assets/Icons/Approval_icon.svg",color: (selectedIndex==2)? AppColors.mainRedColor: Colors.white,), label: "Approvals" ),
        BottomNavigationBarItem(icon: SvgPicture.asset("assets/Icons/nav_profile.svg",color: (selectedIndex==3)? AppColors.mainRedColor: Colors.white,), label: "Approvals" )
      ],
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.mainIndigoColor,
        // selectedIconTheme: Colors.white,
        selectedItemColor: AppColors.mainRedColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (value){
          selectedIndex = value;
          setState(() {

          });
        },
      ),

    );

  }
}