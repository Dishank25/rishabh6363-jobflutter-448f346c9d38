import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/Screens/User_Profile_Screens/User_Notifications_Screen.dart';

import '../../UI_Helper/UI_Helper.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<MessagesScreen> {

  List<Map<String, dynamic>> mContacts = [
    {
      "imgUrl":"https://th.bing.com/th/id/OIP.QDk92j0k_aHWj8rBTF-UsgHaE8?rs=1&pid=ImgDetMain",
      "title": "Lorem ipsum dolor sit amet, consec adipiscing elit. ",
      "desc":"2m ago",
      "mCount": "1",
    },
    {
      "imgUrl":"https://pbs.twimg.com/media/CgvNEXsWkAEDVPa.jpg",
      "title": "Lorem ipsum dolor sit amet, consec adipiscing elit. ",
      "desc":"5m ago",
      "mCount": "2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
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
        body:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 11.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Messages", style: mTextStyle32(mColor: Colors.black),),
                  SizedBox(height: 15,),
                  Expanded(
                    child: ListView.builder(itemCount:mContacts.length,
                        itemBuilder: (_,index){
                          return ListTile(
                            leading: Container(
                              height: 65,
                              width: 65,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(34),
                                  child: Image.network(mContacts[index]['imgUrl']??"", fit: BoxFit.fill,)),
                            ),
                            title: Text(mContacts[index]['title']??"", style: mTextStyle12(),),
                            subtitle:Text(mContacts[index]['desc']??"", style: mTextStyle12(),) ,
                            trailing: Container(
                              height: 19,
                              width: 19,
                              decoration: BoxDecoration(
                                color: AppColors.mainRedColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:Center(child: Text(mContacts[index]['mCount']??"", style: mTextStyle12(mColor: Colors.white))) ,
                            ),
                          );
                        }),
                  )
                ]
            )
        )



    );
  }
}
