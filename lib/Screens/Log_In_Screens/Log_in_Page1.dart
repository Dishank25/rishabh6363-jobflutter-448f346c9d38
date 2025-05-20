import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_portal/Bloc%20State%20Management/Login%20User%20Bloc/UserLoginBloc.dart';
import 'package:job_portal/Bloc%20State%20Management/Login%20User%20Bloc/UserLoginEvent.dart';
import 'package:job_portal/Bloc%20State%20Management/Login%20User%20Bloc/UserLoginState.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../UI_Helper/UI_Helper.dart';


import '../../Widgets/widgets.dart';
import '../Sign_up_Student_Screens/create_account.dart';
import 'Log_in_Page2.dart';




class LogInPage1 extends StatefulWidget {
  @override
  State<LogInPage1> createState() => _SignInPage_1State();
}

class _SignInPage_1State extends State<LogInPage1> {

  String token = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: AppColors.mainColor,
       ),
      body: BlocListener<UserloginBloc, LoginState>(
        listener: (context, state) {
          if (state is UserLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMsg)));
          } else if (state is UserLoginLoadedState) {
            token = state. userLoginData['token'];
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state. userLoginData['message'])));
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) =>LogInPage2()));
          }},
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
           signInHeader(
               onTap:()
               {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CreateAccount()));}
           ),/// Common blue heading
            mSpacer(),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Email", style: mTextStyle12(),),
                        CustomTextField(controller: emailController, hintText: "abc@gmail.com", fillColor: Colors.white,),
                     mSpacer(mHeight: 16.0),
                   Text("Password",style: mTextStyle12()),
                    CustomTextField(controller: passwordController, hintText: "*******", suffixIcon: Icons.visibility_off_outlined,fillColor: Colors.white),
                   mSpacer(mHeight: 16.0),
                    forgetPassRow(),   /// forget password row
                      mSpacer(mHeight: 30.0), // recheck it
                      commonRedContainer(text: "Log In", onTap: ()async{
                           context.read<UserloginBloc>().add(UserLoginEvent(bodyParams: {
                             "email": emailController.text,
                             "password": passwordController.text
                           }));
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           prefs.setString("token", token);
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInPage2()));
                         }),
                      mSpacer(mHeight: 30.0),
                     dividerLine(), /// Divider line
                      mSpacer(),
                      belowBars(text: "Continue with Google",imgUrl: "assets/Icons/google.svg"), /// BelowBars
                      mSpacer(),
                    belowBars(text: "Login with OTP"), /// BelowBars
                      SizedBox(height: 20,
                      )
                ],
                  ),
              ),
            ),
              ],
            ),
        ),
      ),
    );
  }
}


