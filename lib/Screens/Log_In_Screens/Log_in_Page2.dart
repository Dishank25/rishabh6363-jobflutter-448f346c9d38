import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc State Management/Get OTP Bloc/GetOTP Bloc.dart';
import '../../Bloc State Management/Get OTP Bloc/GetOTP Event.dart';
import '../../Bloc State Management/Get OTP Bloc/GetOTP State.dart';
import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import '../Sign_up_Student_Screens/create_account.dart';
import 'Log_in_Page3.dart';

class LogInPage2 extends StatefulWidget{
  @override
  State<LogInPage2> createState() => _LogInPage2State();
}

class _LogInPage2State extends State<LogInPage2> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetOTPBloc, GetOTPState>(
      listener: (context, state) {
        if (state is GetOTPSuccessState) {
          final receivedOtp = state.OTP['otp'];
          // Navigate on success
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogInPage3(receivedOtp: receivedOtp, phoneNumber: phoneController.text,)),
          );
        } else if (state is GetOTPFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.ErrorMsg)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            signInHeader(onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CreateAccount()),
              );
            }),
            mSpacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone Number", style: mTextStyle12()),
                  mSpacer(mHeight: 5.0),
                  CustomTextField(
                    controller: phoneController,
                    hintText: "9988776655",
                    fillColor: Colors.white,
                  ),
                  mSpacer(),
                  commonRedContainer(
                    text: "Get OTP",
                    onTap: () {
                      final phone = phoneController.text.trim();
                      if (phone.isNotEmpty) {
                        context.read<GetOTPBloc>().add(GetOTP(phone));
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage_3(receivedOtp: ,)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please enter a phone number")),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}