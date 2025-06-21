import 'package:flutter/material.dart';

import '../../ui_helper/ui_helper.dart';

class UserTermsConditionsScreen extends StatelessWidget {
  const UserTermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 11.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Terms & Conditions",
                style: mTextStyle32(mColor: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                    "L15.1 Your privacy is important to us. To better protect your privacy, we are providing this notice explaining our policy with regards to the information you share with us. This privacy policy relates to the information we collect, online from Application, received through the email, by fax or telephone, or in person or in any other way and retain and use for the purpose of providing you services. If you do not agree to the terms in this Policy, we kindly ask you not to use these portals and/or sign the contract document.\n \n 15.2 In order to use the services of this Application, You are required to register yourself by verifying the authorised device. This Privacy Policy applies to your information that we collect and receive on and through Doctor 24×7; it does not apply to practices of businesses that we do not own or control or people we do not employ.\n \n 15.3 By using this Application, you agree to the terms of this Privacy Policy."),
              )
            ])));
  }
}
