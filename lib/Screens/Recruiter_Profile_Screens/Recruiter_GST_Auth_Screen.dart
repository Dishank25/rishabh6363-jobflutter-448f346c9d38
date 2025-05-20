import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';

class RecruiterGSTAUTH_Screen extends StatelessWidget {
  const RecruiterGSTAUTH_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  buildCustomAppBar(titleText: "LOGO"),
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(right: 24.0,top: 7.0, left: 24.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("GST Authentication", style: mTextStyle32(mColor: Colors.black),),
           SizedBox(height: 20,),
                  Text("GST number",style: mTextStyle12(),),
                  SizedBox(height: 4,),
                  CustomTextField(controller: GSTController, hintText: "Enter GST Number", fillColor: Color(0xffFFF7FB),),
                  SizedBox(height: 20,),
                  commonRedContainer(text: "Submit", onTap: (){})
    ]
    )
    )
        )
    );
  }
}
