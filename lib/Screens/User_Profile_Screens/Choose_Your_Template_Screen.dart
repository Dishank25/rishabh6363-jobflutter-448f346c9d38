import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/Widgets/widgets.dart';

import '../../UI_Helper/UI_Helper.dart';

class ChooseYourTemplateScreen extends StatefulWidget {
  const ChooseYourTemplateScreen({super.key});

  @override
  State<ChooseYourTemplateScreen> createState() => _ChooseYourTemplateScreenState();
}

class _ChooseYourTemplateScreenState extends State<ChooseYourTemplateScreen> {

  List<Map<String, dynamic>> mTemplates =[
    {
      "S.no": "1",
      "Title": "Template-1",
    },
    {
      "S.no": "2",
      "Title": "Template-2",
    },
    {
      "S.no": "3",
      "Title": "Template-3",
    },
    {
      "S.no": "4",
      "Title": "Template-4",
    },

  ];

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
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 11.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Choose Resume template", style: mTextStyle32(mColor: Colors.black),),
                SizedBox(height: 15,),
                  SizedBox(
                   // height: 500,
                    child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: 160/230,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,),
                      shrinkWrap: true,
                      itemCount: mTemplates.length,
                              itemBuilder: (_,index){
                      return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1, color: Colors.grey)
                                ),
                                 child: Center(child: Text(mTemplates[index]['Title']),),
                      );
                              }),
                  ),
                  SizedBox(height: 20,),
                  Center(child: nextButton(title: "Download", onTap: (){}))
                ]
            )
            ),
          )
    );
  }
}
