import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/ui_helper/ui_helper.dart';
import 'package:job_portal/widgets/widgets.dart';

class UserChangeEmailPage extends StatelessWidget {
  TextEditingController changedEmailController = TextEditingController();
  TextEditingController ChangedEmail_PasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/message_icon.svg"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/notifications_icon.svg"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Change Email",
              style: mTextStyle32(mColor: Colors.black),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                height: 51,
                width: 300,
                child: Text(
                  "Please note that all the data associated with your account will be linked to your new email address after this change.",
                  style: mTextStyle12(),
                )),
            SizedBox(
              height: 15,
            ),
            Text("New Email ID"),
            CustomTextField(
                controller: changedEmailController,
                hintText: "agupta@gmail.com"),
            SizedBox(
              height: 15,
            ),
            Text("Password"),
            CustomTextField(
              controller: ChangedEmail_PasswordController,
              hintText: "*******",
              suffixIcon: Icons.visibility_off_outlined,
            ),
            SizedBox(
              height: 15,
            ),
            Center(child: nextButton(title: "Save Changes", onTap: () {})),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
