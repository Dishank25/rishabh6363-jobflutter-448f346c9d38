import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/Widgets/widgets.dart';

import '../../UI_Helper/UI_Helper.dart';

class RecruiterAnalyticsReports extends StatelessWidget {
  const RecruiterAnalyticsReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App bar
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text("LOGO", style: TextStyle(fontSize: 20, fontFamily: "Inter", fontWeight: FontWeight.w700, color: AppColors.mainColor),),
          ),

          /// Icons
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
        padding: const EdgeInsets.only(right: 24.0,top: 7.0, left: 24.0),
              child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Analytics and Reports", style: mTextStyle32(mColor: Colors.black),),
               SizedBox(height: 25,),
                 Row(
                  children: [
                      Expanded(child: CustomTextField(controller: searchController,hintText: "Search Reports or Stats", fillColor: Colors.white,)),
                         SizedBox(width: 10,),
                         InkWell(
                              onTap: (){},
                             child: SvgPicture.asset("assets/Icons/settings-sliders 1.svg"))
    ],
    ),
    ]
    )
    )
        )
    );
  }
}
