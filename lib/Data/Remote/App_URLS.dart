class AppUrls{
  static const String BaseURL = "  https://b1e9-2405-204-3310-6573-9c97-16a1-c9b2-bac9.ngrok-free.app/";

  static const String RegisterURL ="${BaseURL}api/users/register";
  static const String LoginURL = "${BaseURL}api/users/login";

  static const String GetOTPURL = "${BaseURL}api/mobileotp/sendotp";
  static const String VerifyOTPURL = "${BaseURL}api/mobileotp/verifyotp";
  static const String VerifyEmailOTPURL = "${BaseURL}api/otp/send-otp";
  static const String VerifyEmailURL = "${BaseURL}api/api/otp/verify-otp";
  static const String ForgetPasswordURL = "${BaseURL}api/users/forgotPassword";
 static const String ResetPasswordWithOtpURL ="${BaseURL}api/users/resetPasswordWithOtp";
 static const String GetUserDetails ="${BaseURL}api/users/getUserData";
 static const String FetchCourses = "${BaseURL}api/courses";
  static const String FetchColleges = "${BaseURL}api/colleges";
  static const String FetchSpecializationsURL = "${BaseURL}api/specializations";
  static const String FetchJobRolesURL = "${BaseURL}api/job-roles";
  static const String FetchJobLocationsURL = "${BaseURL}api/locations";
  static const String FetchDomainSkills = "${BaseURL}api/domain/all";
  static const String relatedSkillsURL = "${BaseURL}api/skills/by-domain";
}