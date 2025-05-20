import 'package:flutter/material.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import 'SignUp_Page_Your_preferences.dart';

class SignupPageYourSkills extends StatelessWidget {
  const SignupPageYourSkills({super.key});

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
                      /// HEADE
                         Text("Logo", style: mTextStyle15(mColor: Color(0xff032466), mFontWeight: FontWeight.w700),),
                     mSpacer17(),
                      Container(
                           height: 42,
                       width: double.infinity,
                          child:Text("Your Skills", style: mTextStyle32(mColor:Color(0xff1A1C1E)),),
                    ),
                        Text("Help us match you with the best career opportunities", style: mTextStyle12(),),
                   mSpacer(mHeight: 25.0),
                    SizedBox(height: 3,),
                   mSpacer(mHeight: 25.0),
                               Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                    Text("Areas of Interest", style: mTextStyle12(),),
                                     CustomTextField(controller: searchController, hintText: "List your skills here", suffixIcon: Icons.search,fillColor: Colors.white,),
                                     mSpacer(mHeight: 16.0),
                                     preferenceContainer(finalHeight: 23, finalWeight: 100, cName: "Digital Marketing",onTap: (){}),
                                     mSpacer17(),
                                     preferenceContainer(finalHeight: 23, finalWeight: 100, cName: "Graphic Design", onTap: (){}),
                                     mSpacer17(),
                                     Text("Related skills you might know", style: mTextStyle12(),),
                                     SizedBox(height: 10,),
                                     Row(
                                       children: [
                                         courseName( name:"SEO", mIcon: Icons.add,  ),
                                         Spacer(),
                                         courseName( name:"Content Writing", mIcon: Icons.add ),
                                         Spacer(),
                                         courseName( name:"Digital Marketing", mIcon: Icons.add ),
                                       ],
                                     ),
                                     SizedBox(height: 6,),
                                     courseName( name:"See More", mIcon: Icons.add, bgColor: Color(0xff1961F3)),
                                     mSpacer(mHeight: 24.0),
                                     Row(
                                       children: [
                                         InkWell(
                                         onTap: (){},
                                          child: Container(
                                             height: 40,
                                                width: 100,
                                             decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                               border: Border.all(color: Color(0xff6C7278))
                                                ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.arrow_back, size: 16,),
                                                Text("Back", style: mTextStyle14(),),
                                              ],
                                            ),
                                          ),
                                      ),
                                         Spacer(),
                                         nextButton(title: "Next", onTap: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPageYourPreferences()));
                                         })

                                       ],

                                     )
                                   ]
                               )
    ]
    )
    )
        )
    );
  }
}