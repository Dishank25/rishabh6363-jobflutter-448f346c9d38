import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../UI_Helper/UI_Helper.dart';


/// CUSTOMIZED APPBAR

PreferredSizeWidget buildCustomAppBar({required String titleText}) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        titleText,
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
          color: AppColors.mainColor,
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/Icons/message_icon.svg"),
        padding: const EdgeInsets.only(right: 20.0),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/Icons/notifications_icon.svg"),
        padding: const EdgeInsets.only(right: 20.0),
      ),
    ],
  );
}





/// HEADING PART WIDGET
 Widget signInHeader({required VoidCallback onTap}){
   return  Container(
     height: 220,
     width: double.infinity,
     decoration: BoxDecoration(
         color: AppColors.mainColor
     ),
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 24.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Logo", style: mTextStyle15(),),
           mSpacer(),
           Container(
             height: 113,
             width: 327,
             child: Text("Sign in to your Account", style: mTextStyle32(),),
           ),
           mSpacer(mHeight: 10.0),
           Row(
             children: [
               Text("Don't have an account?", style: mTextStyle12(mColor: Colors.white),),
               InkWell(
                   onTap: onTap,
                   child: Text(" Sign Up", style: TextStyle(color: AppColors.secondaryColor, fontSize: 12, fontWeight: FontWeight.w600,  )))
             ],
           )
         ],
       ),
     ),
   );
 }

/// FORGET PASSWORD ROW
 Widget forgetPassRow({required VoidCallback ontap}){
   return Row(
     children: [
       Container(
         height: 11.08,
         width: 11.08,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(2),
             border: Border.all(color: Color(0xff6C7278), width: 1)
         ),
       ),
       SizedBox(width: 6.0,),
       Text("Remember me", style: mTextStyle12(),),
       Spacer(),
       InkWell(
         onTap: ontap,
           child: Text("Forgot Password?", style: mTextStyle12(mColor: AppColors.blueTextColor, mFontWeight: FontWeight.w600),)),
     ],
   );
 }

 /// COMMON CONTAINER WIDGET
Widget commonRedContainer({required String text, VoidCallback ? onTap}){
   return InkWell(
     onTap: onTap,
     child: Container(
       height: 48,
       width: double.infinity,
       decoration: BoxDecoration(
         color: AppColors.secondaryColor,
         borderRadius: BorderRadius.circular(10),
       ),
       child: Center(child: Text(text, style: mTextStyle14(mColor: Colors.white),)),
     ),
   );
 }

 /// DIVIDER LINE
 Widget dividerLine(){
   return Row(
     children: [
       Expanded(child: Divider(
         thickness: 1,
         color:  Colors.grey[400],
         endIndent: 10,
       )
       ),
       Text(
         "OR",
         style: mTextStyle14(
             mColor:Colors.grey.shade500
         ),
       ),
       Expanded(
         child: Divider(
           thickness: 1,
           color: Colors.grey[400],
           indent: 10,
         ),
       ),
     ],
   );
 }

/// BELOW BARS
Widget belowBars({required String text, String ? imgUrl}){
  return  Container(
    height: 48,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade500)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(imgUrl!=null)...[
          Container(
            height: 18,
            width: 18,
            child: SvgPicture.asset("assets/Icons/google.svg", height: 18,width: 18,),
          ),
          SizedBox(width: 5,),],
        Text(text, style: mTextStyle14(mFontWeight: FontWeight.w600),)
      ],
    ),
  );
}


/// CUSTOM TEXTFIELDS
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final VoidCallback? onSuffixTap;
  final String? Function(String?)? validator;
  final Color? fillColor;


  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.onSuffixTap,
    this.obscureText = false,
    this.validator,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          style: mTextStyle14(),
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? const Color(0xffFFF7FB),
            hintText: hintText,
            labelText: labelText,
            hintStyle: mTextStyle14(
              mFontWeight: FontWeight.w500,
              mColor: const Color(0xffBCC1CA),
            ),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
              onTap: onSuffixTap,
              child: Icon(
                suffixIcon,
                size: 20,
                color: const Color(0xffBCC1CA),
              ),
            )
                : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), // maintain height
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Color(0xffBCC1CA)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Color(0xffBCC1CA)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5, color: Colors.red),
            ),
            errorStyle: const TextStyle(
              fontSize: 12,
              height: 1.0, // Control line height
            ),
          ),
        ),
       // const SizedBox(height: 12), // spacing between fields
      ],
    );
  }
}

/// TEXTFILEDS

TextEditingController paymentCardController = TextEditingController();
TextEditingController CVVController = TextEditingController();
TextEditingController ValidUptoController = TextEditingController();
TextEditingController ticketController = TextEditingController();
TextEditingController InternshipProfileController = TextEditingController();
TextEditingController SkillsRequiredController = TextEditingController();
TextEditingController responsibilitiesController = TextEditingController();
TextEditingController preferencesController = TextEditingController();
TextEditingController no_openingController = TextEditingController();
TextEditingController minStipendController = TextEditingController();
TextEditingController minIncentivesController = TextEditingController();
TextEditingController maxStipendController = TextEditingController();
TextEditingController maxIncentivesController = TextEditingController();
TextEditingController alterPhoneController = TextEditingController();
 TextEditingController startDateController = TextEditingController();
 TextEditingController endDateController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController internshipDurationController = TextEditingController();
TextEditingController internshipDurationMonthsController = TextEditingController();
TextEditingController minSalaryController = TextEditingController();
TextEditingController maxSalaryController = TextEditingController();
TextEditingController recruiterNameController = TextEditingController();
TextEditingController recruiter_SurNameController = TextEditingController();
TextEditingController newPassController = TextEditingController();
TextEditingController courseCollegeController = TextEditingController();






///  OPTION CONTAINER (For any kind of option like courses option, user-type option)
Widget OptionContainer({
  required String title,
  bool isSelected = false,
  VoidCallback ? onTap,
   String? imgPath,
IconData? mIcon}){

  final hasImg = imgPath!=null && imgPath.isNotEmpty;
  return GestureDetector(
    onTap: onTap,
    child: Container(
    //  height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.69),
          border: Border.all(color: Colors.grey.shade400/*Color(0xffEDF1F3,)*/, width: 1.0),
        color: isSelected==true? Color(0xff1961F3):Color(0xffFFF7FB)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: hasImg? MainAxisAlignment.spaceAround:MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                  height:14,
                  width: 12,
                  child: SvgPicture.asset(imgPath??"", color:isSelected==true?Colors.white:Colors.black ,), /*color:isSelected==true?Colors.white:Colors.black*/  ),
            ),
            SizedBox(width: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(title, style: TextStyle(fontSize: 13,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  color: isSelected==true?Colors.white:Colors.black ), ),
            ),
            Padding(padding: const EdgeInsets.only(right: 4.0),child: Icon(mIcon, size: 10,),)
          ],
        ),
      ),
    ),
  );
}

/// NEXT BUTTON AT THE BOTTOM
Widget nextButton({required String title, required VoidCallback onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryColor
      ),
      child: Center(child: Text(title, style: mTextStyle14(mColor: Colors.white),)),
    ),
  );
}

/// SIZEBOX OF HEIGHT 17
Widget mSpacer17(){
  return SizedBox(height: 17,);
}

/// PREFERENCE CONTAINER
Widget preferenceContainer({
  required String cName,
  IconData? cIcon,
  required VoidCallback onTap,
  Color? bgColor,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffBCC1CA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // auto height
        children: [
          Row(
            children: [
              courseName(name: cName, bgColor: const Color(0xff1961F3), mIcon: cIcon),
              const Spacer(),
              courseName(name: "Upload Certificate"),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset("assets/Icons/doubt_icon.svg"),
                ),
              )
            ],
          ),
          const SizedBox(height: 7),
          Text("Where did you learn this skill?", style: mTextStyle12()),
          const SizedBox(height: 8),
          CustomTextField(
            controller: courseCollegeController,
            hintText: "College/Company Name",
            fillColor: Colors.white,
          )
        ],
      ),
    ),
  );
}
/// Widget for course names

Widget courseName({
  required String name,
  IconData? mIcon,
  Color? bgColor,
  VoidCallback? onTap
}) {
  final Color background = bgColor ?? Colors.grey[300]!; // Default grey
  final bool isDefaultGrey = background == Colors.grey[300];
  final Color textColor = isDefaultGrey ? Colors.black : Colors.white;

  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      //height: 24,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xffEFF0F6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // <<<<< This makes width shrink-wrap content
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 13, color: textColor),
          ),
          if (mIcon != null) ...[
            const SizedBox(width: 6),
            Icon(mIcon, size: 12, color: textColor), // Match icon color to text color
          ],
        ],
      ),
    ),
  );
}


