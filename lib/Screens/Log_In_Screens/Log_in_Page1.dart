import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Screens/Common_Screens/Forgot_password_Screen.dart';
import 'package:job_portal/Screens/Sign_up_Student_Screens/Sign_up_Student(1).dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Bloc State Management/Login User API/UserLoginBloc.dart';
import '../../Bloc State Management/Login User API/UserLoginEvent.dart';
import '../../Bloc State Management/Login User API/UserLoginState.dart';
import '../../Service_locator/Service_Locator.dart';
import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import '../Sign_up_Student_Screens/LoginWithEmailOtpScreen.dart';
import '../Sign_up_Student_Screens/create_account.dart';
import 'loginWithEmailOTP.dart';


class LogInPage1 extends StatefulWidget {
  @override
  State<LogInPage1> createState() => _SignInPage_1State();
}

class _SignInPage_1State extends State<LogInPage1> {
  String token = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("LOGO", style: mTextStyle12(mColor: Colors.white),),
        ),
        backgroundColor: AppColors.mainIndigoColor,
      ),
      body: BlocListener<UserloginBloc, LoginState>(
        listener: (context, state) async{
          print("Login State: $state");
          if (state is UserLoginErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMsg)));
          } else if (state is UserLoginLoadedState) {

            token = state.userLoginData['token'];
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString("token", token);

            // Setup GetIt after login
            setupLocator(token);

            // Save email to SharedPreferences
            await prefs.setString("user_email", emailController.text.trim());
            print("All keys: ${prefs.getKeys()}");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.userLoginData['message']))
            );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CreateAccount())
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              signInHeader(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccount()),
                  );
                },
              ),
              mSpacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email", style: mTextStyle14()),
                      CustomTextField(
                        controller: emailController,
                        hintText: "abc@gmail.com",
                        fillColor: Colors.white,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      mSpacer(mHeight: 16.0),
                      Text("Password", style: mTextStyle14()),
                      CustomTextField(
                        controller: passwordController,
                        hintText: "*******",
                        suffixIcon: Icons.visibility_off_outlined,
                        fillColor: Colors.white,
                       // isObscure: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      mSpacer(mHeight: 16.0),
                      forgetPassRow(ontap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordScreen()));}),
                      mSpacer(mHeight: 30.0),
                      commonRedContainer(
                        text: "Log In",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<UserloginBloc>().add(
                              UserLoginEvent(bodyParams: {
                                "email": emailController.text.trim(),
                                "password": passwordController.text.trim(),
                              }),
                            );
                            /*SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setString("token", token);*/
                          }
                        },
                      ),
                      mSpacer(mHeight: 30.0),
                      dividerLine(),
                      mSpacer(),
                      belowBars(
                          text: "Continue with Google",
                          imgUrl: "assets/Icons/google.svg",
                      onTap: (){}),
                      mSpacer(),
                      belowBars(text: "Login with OTP",
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginWithEmailOtpScreen()));
                      }),
                      SizedBox(height: 20),
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