import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Screens/Log_In_Screens/Log_in_Page1.dart';
import '../../Bloc State Management/Register User API/RegisterUserBloc.dart';
import '../../Bloc State Management/Register User API/RegisterUserEvent.dart';
import '../../Bloc State Management/Register User API/RegisterUserState.dart';
import '../../Data/Remote/API_Helper.dart';
import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import 'Sign_up_Student(2).dart';

class SignUpStudent_1 extends StatefulWidget {
  final String userType; // "student" or "recruiter"
  const SignUpStudent_1({super.key, required this.userType});

  @override
  State<SignUpStudent_1> createState() => _SignUpStudent_1State();
}

class _SignUpStudent_1State extends State<SignUpStudent_1> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: BlocListener<RegisterUserBloc, RegisterUserState>(
        listener: (context, state) async{
          if (state is RegisterUserLoadingState) {
            setState(() => isLoading = true);
          } else {
            setState(() => isLoading = false);
          }

          if (state is RegisterUserFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMsg)),
            );
          }

          if (state is RegisterUserSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User registered successfully")));

            await Future.delayed(Duration(seconds: 1));
            if (!mounted) return;
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LogInPage1()));
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mSpacer(mHeight: 16.0),
                Text("Sign Up", style: mTextStyle32(mColor: Color(0xff1A1C1E))),
                mSpacer(),
                Text("Create an account to continue!", style: mTextStyle14()),
                mSpacer(mHeight: 24.0),

                // First and Last Name
                Row(
                  children: [
                    Text(" First Name", style: mTextStyle12()),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: Text("Last Name", style: mTextStyle12()),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 165,
                      child: CustomTextField(
                        controller: firstNameController,
                        hintText: "Aman",
                        suffixIcon: Icons.person,
                        fillColor: Colors.white,
                        validator: (value) => value == null || value.isEmpty ? 'First name required' : null,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 160,
                      child: CustomTextField(
                        controller: surnameController,
                        hintText: "Gupta",
                        fillColor: Colors.white,
                        validator: (value) => value == null || value.isEmpty ? 'Last name required' : null,
                      ),
                    ),
                  ],
                ),

                mSpacer(mHeight: 15.0),
                Text("Email", style: mTextStyle12()),
                CustomTextField(
                  controller: emailController,
                  hintText: "abc@gmail.com",
                  suffixIcon: Icons.email,
                  fillColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Email required';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Enter a valid email';
                    return null;
                  },
                ),

                mSpacer(mHeight: 15.0),
                Text("Password", style: mTextStyle12()),
                CustomTextField(
                  controller: passwordController,
                  hintText: "*******",
                  suffixIcon: Icons.visibility_off_outlined,
                  fillColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Password required';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),

                mSpacer(mHeight: 15.0),
                Text("Phone Number", style: mTextStyle12()),
                CustomTextField(
                  controller: phoneController,
                  hintText: "7895674320",
                  keyboardType: TextInputType.number,
                  suffixIcon: Icons.call,
                  fillColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Phone Number required';
                    if (value.length < 10) return 'Phone Number must be 10 digits';
                    return null;
                  },
                ),

                mSpacer(),
                commonRedContainer(
                  text: "Register",
                 // isLoading: isLoading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      final body = {
                        "firstName": firstNameController.text.trim(),
                        "lastName": surnameController.text.trim(),
                        "email": emailController.text.trim(),
                        "phone": phoneController.text.trim(),
                        "password": passwordController.text,
                        "userRole": widget.userType,
                      };

                      context.read<RegisterUserBloc>().add(
                        RegisteredUserEvent(bodyParams: body),
                      );
                    }
                  },
                ),

                mSpacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("By signing up, you agree to our", style: mTextStyle12()),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Terms and Conditions",
                        style: mTextStyle14(mFontWeight: FontWeight.w900, mColor: AppColors.blueTextColor),
                      ),
                    )
                  ],
                ),
                mSpacer(mHeight: 25.0),
                dividerLine(),
                mSpacer(),
                belowBars(text: "Continue with Google", imgUrl: "assets/Icons/google.svg"),
                mSpacer(mHeight: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: mTextStyle12()),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LogInPage1()));
                      },
                      child: Text(
                        " Login",
                        style: mTextStyle14(mColor: AppColors.blueTextColor, mFontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





















/*
class SignUpStudent_1 extends StatefulWidget {
  final String userType;
  SignUpStudent_1({required this.userType});
  @override
  State<SignUpStudent_1> createState() => _SignUpStudent_1State();
}

class _SignUpStudent_1State extends State<SignUpStudent_1> {

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: mTextStyle32(mColor: Color(0xff1A1C1E)),
                  ),
                  mSpacer(),
                  Text(
                    "Create an account to continue!",
                    style: mTextStyle14(),
                  ),
                  mSpacer(mHeight: 24.0),
                  Row(
                    children: [
                      Text(" First Name", style: mTextStyle12(),),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 100.0),
                        child: Text("Last Name", style: mTextStyle12(),),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 165,
                        child: CustomTextField(
                          controller: firstNameController,
                          hintText: "Aman",
                          suffixIcon: Icons.person,
                          fillColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'First name required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 160,
                        child: CustomTextField(
                          controller: surnameController,
                          hintText: "Gupta",
                          fillColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Last name required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  mSpacer(mHeight: 16.0),
                  Text("Email", style: mTextStyle12(),),
                  CustomTextField(
                    controller: emailController,
                    hintText: "abc@gmail.com",
                    suffixIcon: Icons.email,
                    fillColor: Colors.white,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email required';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  mSpacer(mHeight: 16.0),
                  Text("Password", style: mTextStyle12()),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "*******",
                    suffixIcon: Icons.visibility_off_outlined,
                    fillColor: Colors.white,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  mSpacer(mHeight: 16.0),
                  Text("Phone Number", style: mTextStyle12()),
                  CustomTextField(
                    controller: phoneController,
                    hintText: "7895674320",
                   keyboardType: TextInputType.number,
                   suffixIcon: Icons.call,
                    fillColor: Colors.white,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number required';
                      }
                      if (value.length < 10) {
                        return 'Phone Number must be of 10 digits';
                      }
                      return null;
                    },
                  ),
                  mSpacer(),
                  commonContainer(
                    text: "Register",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        StatefulBuilder(
                            builder: (context, ss) {
                              return BlocListener<RegisterUserBloc, RegisterUserState>(
                                  listener: (context, state) {
                                    if (state is RegisterUserLoadingState) {
                                      isLoading = true;
                                      ss(() {});
                                    }
                                    if (state is RegisterUserFailedState) {
                                      isLoading = false;
                                      ss(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: Text(state.errorMsg)));
                                    }
                                    if (state is RegisterUserSuccessState) {
                                      isLoading = false;
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        String firstName = firstNameController.text
                                            .toString();
                                        String surname = surnameController.text.toString();
                                        String email = emailController.text.toString();
                                        String phone = phoneController.text.toString();
                                        String password = passwordController.text
                                            .toString();

                                        context.read<RegisterUserBloc>().add(
                                            RegisteredUserEvent(
                                                bodyParams:
                                                {  "firstName": firstName,
                                                  "lastName": surname,
                                                  "email": email,
                                                  "phone": phone,
                                                  "password": password,
                                                  "userRole": widget.userType}));
                                      }
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Registered Succesfully")));
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpStudent_2()));
                                    },)
                              );
                            });
                      };
                    }),
                  mSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("By signing up, you agree to our", style: mTextStyle12(),),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          " Terms and Conditions",
                          style: mTextStyle14(mFontWeight: FontWeight.w900, mColor: AppColors.blueTextColor),
                        ),
                      )
                    ],
                  ),
                  mSpacer(mHeight: 26.0),
                  dividerLine(),
                  mSpacer(),
                  belowBars(text: "Continue with Google", imgUrl: "assets/Icons/google.svg"),
                  mSpacer(mHeight: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: mTextStyle12(),),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignInPage_1()),
                          );
                        },
                        child: Text(
                          " Login",
                          style: mTextStyle14(
                            mColor: AppColors.blueTextColor,
                            mFontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

*/
