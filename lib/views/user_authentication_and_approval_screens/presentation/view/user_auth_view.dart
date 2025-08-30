import 'dart:developer' as developer show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/widgets/widgets.dart';

import '../../../../../../../ui_helper/ui_helper.dart';
import '../bloc/user_auth_bloc.dart';
import '../bloc/user_auth_event.dart';
import '../bloc/user_auth_state.dart';

class UserAuthScreen extends StatefulWidget {
  final String? phoneNumber;

  const UserAuthScreen({super.key, this.phoneNumber});
  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  /*final VoidCallback ? onCallBack;
  UserAuthScreen({this.onCallBack});*/
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController otpReceivedController = TextEditingController();
  TextEditingController AadharController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  TextEditingController linkedPhoneController = TextEditingController();
  TextEditingController nOtpController = TextEditingController();
  TextEditingController nEmailController = TextEditingController();
  TextEditingController cellPhoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.phoneNumber != null) {
      developer.log('Phone number from prev screen : ${widget.phoneNumber}');
      setState(() {
        phoneNoController.text = widget.phoneNumber!;
      });
      developer
          .log('Phone number in controller: ${phoneNoController.text.trim()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 11.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Authentication",
                        style: mTextStyle32(mColor: Colors.black),
                      ),
                      const SizedBox(height: 58),
                      Container(
                          height: 268,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFF6E9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xffFFA322), width: 1.0),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone Number",
                                      style: mTextStyle12(
                                          mColor: Color(0xff6C7278)),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 230,
                                          child: CustomPhoneField(
                                            controller: phoneNoController,
                                          ),
                                        ),
                                        const Spacer(),
                                        sendOTPContainer(phoneNoController),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text("OTP",
                                        style: mTextStyle12(
                                            mColor: const Color(0xff6C7278))),
                                    CustomTextField(
                                      controller: otpReceivedController,
                                      hintText: "6 digit number",
                                      fillColor: const Color(0xffFFFFFC),
                                    ),
                                    const SizedBox(height: 20),
                                    Center(
                                      child: SizedBox(
                                        width: 204,
                                        child: BlocConsumer<UserAuthBloc,
                                            UserAuthState>(
                                          listener: (context, state) {
                                            if (state is UserAuthSuccess) {
                                              showSnackbar(
                                                  state.message.contains(
                                                          "OTP verified successfully. You are logged in.")
                                                      ? "Phone number verified successfully!"
                                                      : "OTP sent successfully!",
                                                  context);
                                            } else if (state
                                                is UserAuthFailure) {
                                              showSnackbar(
                                                  "Failed to verify phone number. Please try again.",
                                                  context);
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state is UserAuthLoading) {
                                              return CircularProgressIndicator();
                                            }
                                            return commonRedContainer(
                                              text: "Verify Phone Number",
                                              onTap: () {
                                                final phone = phoneNoController
                                                    .text
                                                    .trim();
                                                final otp =
                                                    otpReceivedController.text
                                                        .trim();
                                                if (phone.isNotEmpty &&
                                                    otp.isNotEmpty) {
                                                  context
                                                      .read<UserAuthBloc>()
                                                      .add(
                                                        VerifyPhoneNumberEvent(
                                                          phoneNumber: phone,
                                                          otp: otp,
                                                        ),
                                                      );
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ]))),
                      SizedBox(
                        height: 21,
                      ),
                      Container(
                        height: 430,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffFFF6E9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xffFFA322), width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Aadhar ID",
                                  style:
                                      mTextStyle12(mColor: Color(0xff6C7278))),
                              CustomTextField(
                                  controller: AadharController,
                                  hintText: "Aadhar Card Number",
                                  fillColor: Color(0xffFFFFFC)),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text("Date of Birth",
                                      style: mTextStyle12(
                                        mColor: Color(0xff6C7278),
                                      )),
                                  Spacer(),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 100.0),
                                    child: Text("Upload file",
                                        style: mTextStyle12(
                                            mColor: Color(0xff6C7278))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: 165,
                                      child: CustomTextField(
                                          controller: dateBirthController,
                                          hintText: "DD/MM/YYYY",
                                          fillColor: Color(0xffFFFFFC))),
                                  Spacer(),
                                  SizedBox(
                                    width: 165,
                                    child: CustomTextField(
                                        controller: uploadController,
                                        hintText: "Browse File",
                                        suffixIcon: Icons.upload_file,
                                        fillColor: Color(0xffFFFFFC)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Linked Phone Number",
                                style: mTextStyle12(mColor: Color(0xff6C7278)),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: 230,
                                      child: CustomTextField(
                                          controller: cellPhoneController,
                                          hintText: "+91xxxxxxxxxx",
                                          fillColor: Color(0xffFFFFFC))),
                                  Spacer(),
                                  sendOTPContainer(cellPhoneController),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "OTP",
                                style: mTextStyle12(mColor: Color(0xff6C7278)),
                              ),
                              CustomTextField(
                                  controller: nOtpController,
                                  hintText: "6 digit number",
                                  fillColor: Color(0xffFFFFFC)),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: SizedBox(
                                    width: 204,
                                    child: commonRedContainer(
                                        text: "Verify Phone Number")),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Resend OTP",
                                        style: mTextStyle12(
                                          mColor: AppColors.blueTextColor,
                                        ),
                                      )),
                                  Text(" in 15 seconds")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xff1DB32F), width: 1.0),
                            color: Color(0xffDFF7EA)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email ID",
                                style: mTextStyle12(),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              CustomTextField(
                                controller: nEmailController,
                                hintText: "ABC@gmail.com",
                                fillColor: Color(0xffFFFFFC),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Edit/Change",
                                    style: mTextStyle12(
                                        mColor: AppColors.blueTextColor),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ]))));
  }
}

Widget sendOTPContainer(TextEditingController phoneController) {
  return BlocConsumer<UserAuthBloc, UserAuthState>(
    builder: (context, state) {
      if (state is UserAuthLoading) {
        return Container(
          height: 48,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xffFFA322).withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                  strokeWidth: 1, color: Colors.white),
            ),
          ),
        );
      }
      return GestureDetector(
        onTap: () {
          final phone = phoneController.text.trim();
          if (phone.isNotEmpty) {
            context
                .read<UserAuthBloc>()
                .add(SendOtpToMobileEvent(phoneNumber: phone));
          }
        },
        child: Container(
          height: 48,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xffFFA322),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Send OTP",
              style: mTextStyle14(mColor: Colors.white),
            ),
          ),
        ),
      );
    },
    listener: (context, state) {
      if (state is UserAuthSuccess) {
        showSnackbar("OTP sent successfully!", context);
      } else if (state is UserAuthFailure) {
        showSnackbar("Failed to send OTP. Please try again.", context);
      }
    },
  );
}
