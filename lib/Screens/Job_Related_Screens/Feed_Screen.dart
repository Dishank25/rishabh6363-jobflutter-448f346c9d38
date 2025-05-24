import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/Screens/Job_Related_Screens/Feed_Screen_2.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import '../User_Profile_Screens/User_messages_screen.dart';
import 'Job_details_Screen.dart';

class FeedScreen extends StatefulWidget {
  final bool showFeed2 ;
  final VoidCallback ? onCallBackFromFeed2;

  FeedScreen({this.onCallBackFromFeed2, this.showFeed2 = false});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  TextEditingController feedSearchController = TextEditingController();

  List<Map<String, dynamic>> uList = [
    {
      "company_name": "Uber",
      "image": "https://static-00.iconduck.com/assets.00/uber-icon-1024x1024-4icncyyo.png",
      "posted": "2 days",
      "No_followers": "123,456 followers",
      "mainImage": "assets/Images/uber_driver.jpg"

    },
  ];


  @override
  Widget build(BuildContext context) {
    if(widget.showFeed2){
      return FeedScreen2(
        onBack: widget.onCallBackFromFeed2
      );
    }


    return Scaffold(
      appBar: AppBar(
                 title: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 12.0),
                     child: Text("LOGO", style: TextStyle(fontSize: 20, fontFamily: "Inter", fontWeight: FontWeight.w700, color: AppColors.mainIndigoColor),),
                  ),
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
                        onTap: (){},
                        child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                             child: SvgPicture.asset("assets/Icons/notifications_icon.svg"),
    ),),]),

                         body: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 24.0),
                           child: Column(
                             children: [
                               Row(
                                 children: [
                                   SizedBox(
                                       width: 300,
                                       child: CustomTextField(controller: feedSearchController, hintText: "Search", suffixIcon: Icons.search,fillColor: Colors.white,)),
                                   SizedBox(width: 40,),
                                   SvgPicture.asset("assets/Icons/settings-sliders 1.svg")
                                 ],
                               ),
                               SizedBox(height: 30,),
                               Expanded(
                                 child: GridView.builder(
                                   itemCount: uList.length,
                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 1,
                                     mainAxisSpacing: 20,
                                 childAspectRatio: 315/327),
                                     itemBuilder: (_,index) {
                                       return FeedCard(imageUrl: uList[index]["image"],
                                           company: uList[index]['company_name'],
                                           posted: uList[index]['posted'],
                                           No_followers: uList[index]['No_followers'],
                                       mainImage: uList[index]['mainImage'],);
                                     }
                                 ),
                               ),

                                     ],
                                   ),
                                 )
                                   );
  }
}

/// FEED CARD WIDGET
class FeedCard extends StatelessWidget {
  final String imageUrl, company, posted,  No_followers;
      final String ? mainImage;

  const FeedCard({
    required this.imageUrl,
    required this.company,
    required this.posted,
    required this.No_followers,
    this.mainImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// First Row - Icon + Title + Company + Right Tags
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageUrl, height: 48, width: 48, fit: BoxFit.cover),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Text(jobTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(company, style: TextStyle(color: Colors.grey)),
                    Text(No_followers)
                  ],
                ),
              ),
              Icon(Icons.more_vert)
            ],
          ),
          SizedBox(height: 12),
          /// Second Row - Grey Containers aligned Left under the Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              greyContainer(text: posted, bgColor: Color(0xffEFF0F6)),
              SizedBox(width: 8),
              greyContainer(text: "Sponsered", bgColor: Color(0xffEFF0F6)),
            ],
          ),
         // SizedBox(height: 10,),
          if (mainImage != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset(mainImage!, fit: BoxFit.cover,),
              ),
            ),
          Text("Lorem ipsum dolor sit amet, consec adipiscing elit. ", style: mTextStyle12(mFontWeight: FontWeight.w400),),
          Text("Read more...", style: mTextStyle12(mColor: Color(0xff8F8F8F)), )
          

        ],
      ),
    );
  }
}

/// Customized Floating Action Button