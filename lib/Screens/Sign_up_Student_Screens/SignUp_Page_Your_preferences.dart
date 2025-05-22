import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Bottom_Nav_Bar/Student_Bottom_Nav_Bar.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import '../Job_Related_Screens/Job_Search_Screen.dart';

class SignupPageYourPreferences extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
               body:  SingleChildScrollView(
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
                          height: 42,
                          width: double.infinity,
                             child:Text("Your Preferences", style: mTextStyle32(mColor:Color(0xff1A1C1E)),),
                      ),
                         Text("Help us match you with the best career opportunities", style: mTextStyle12(),),
                       mSpacer(mHeight: 25.0),
                       SizedBox(height: 3,),
                       mSpacer(mHeight: 25.0),
                       Container(
                         height: 200,
                         width: double.infinity,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Currently looking for:", style: mTextStyle12(),),
                             Row(
                               children: [
                                 OptionContainer(/*mHeight: 32, mWidth: 74,*/ title:"Jobs +", ),
                                 SizedBox(width: 12,),
                                 OptionContainer(/*mHeight: 32, mWidth: 100,*/ title:"Internships +", ),
                                 SizedBox(width: 12,),
                                 OptionContainer(/*mHeight: 32, mWidth: 74,*/ title:"Projects  +",  ),
                               ],
                             ),
                             mSpacer(mHeight: 25.0),
                             Text("Work Mode:", style: mTextStyle12(),),
                             Row(
                               children: [
                                 OptionContainer(/*mHeight: 32, mWidth: 100,*/ title:"In-Office  +",  ),
                                 SizedBox(width: 12,),
                                 OptionContainer(/*mHeight: 32, mWidth: 80, */title:"Hybrid  +", ),
                                 SizedBox(width: 12,),
                                 OptionContainer(/*mHeight: 32, mWidth: 130,*/ title:"Work From Home  +",  ),
                               ],
                             ),
                             mSpacer(mHeight: 25.0),
                            Center(
                              child: SizedBox(
                                width: 139,
                                  child: nextButton(title: "Find opportunities", onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_Bottom_Nav_bar()));
                                  })),
                            )
                            // commonContainer(text: "Find opportunities")
                           ],
                         ),
                       )

          ]
                )
                       )
                   )
              );
             }
         }
