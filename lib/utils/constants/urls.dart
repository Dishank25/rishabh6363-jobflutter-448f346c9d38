// base url and other const data

class Urls {
  static const baseurlIP = "http://212.95.51.83:5000/";
  static const baseUrl = "${baseurlIP}api/";

  static const userRegisteration = "users/register";
  static const userLogin = "users/login";
  static const sendOtpEmail = "otp/send-otp";
  static const verifyOtpEmail = "otp/verify-otp";
  static const getUserBasicInfo = "users/getUserData";
  static const getColleges = "colleges";
  static const getSpecialization = "specializations";
  static const getCourses = "courses";
  static const getDomainAll = "domain/all";
  static const getSubSkills = "skills/by-domain";
  static const getJobRoles = "job-roles";
  static const submitDetailedUserProfile = "user-details/detail";
  static const submitSkillsAndCertificates = "upload-skill";
  static const getInternshipFormMetadata = "internship-filters";
  static const createJobPost = "jobpost/create";
  static const opportunities = "opportunities";
  static const jobDetails = "jobdetails/";
  static const getLocations = "locations";
  static const getFeedPosts = "feed/posts";
  static const getPublicProfile = "user-details/public-profile/";
  static const getUserDetails = "user-details/detail/";
  static const getTermsAndConditions = "user-details/getTermsAndCondition";
  static const updateUserDetailsById = "user-details/detail/";
  static const changeUserEmail = "users/changeEmail";
  static const feedPostLike1 = "feed/posts/";
  static const feedPostLike2 = "/like";
  static const feedPostComment1 = "feed/posts/";
  static const feedPostComment2 = "/comment";
  static const applyForJob = "jobpost/apply/{jobId}";
  static const uploadFileGetUrl = "upload-image";
  static const createFeedPost = "feed/feed";
}
