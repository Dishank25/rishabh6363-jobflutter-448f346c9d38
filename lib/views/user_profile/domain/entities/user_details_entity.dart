class UserDetailEntity {
  final int id;
  final int user_id;
  final String first_name;
  final String last_name;
  final String email;
  final String phone;
  final String dob;
  final String? aadhaarNumber;
  final String? aadhaarCardFile;
  final bool isAadhaarVerified;
  final String? currentLocation;
  final String gender;
  final String user_type;
  final String? jobLocation;
  final String? salary_details;
  final String? currently_looking_for;
  final String? work_mode;
  final String? aboutUs;
  final String? career_objective;
  final String? resume;
  final String? language;
  final bool is_email_verified;
  final bool is_phone_verified;
  final bool is_gst_verified;
  final String? userProfilePic;
  final bool terms_and_condition;
  final DateTime created_at;
  final DateTime updated_at;
  final List<UserEducationEntity> educations;
  final List<UserExperienceEntity> experiences;
  final List<ProfileSkillEntity> skills;

  UserDetailEntity({
    required this.id,
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.aadhaarNumber,
    required this.aadhaarCardFile,
    required this.isAadhaarVerified,
    required this.currentLocation,
    required this.gender,
    required this.user_type,
    required this.jobLocation,
    required this.salary_details,
    required this.currently_looking_for,
    required this.work_mode,
    required this.aboutUs,
    this.career_objective,
    required this.resume,
    required this.language,
    required this.is_email_verified,
    required this.is_phone_verified,
    required this.is_gst_verified,
    this.userProfilePic,
    required this.terms_and_condition,
    required this.created_at,
    required this.updated_at,
    required this.educations,
    required this.experiences,
    required this.skills,
  });
}

class UserEducationEntity {
  final int id;
  final String level;
  final int school_college_id;
  final String board_or_university;
  final int course_id;
  final int specialization_id;
  final String start_year;
  final String end_year;
  final String percentage_or_cgpa;
  final String education_certificate;
  final SchoolCollegeEntity? schoolCollege;
  final UDCourseEntity? course;
  final UDSpecializationEntity? specialization;

  UserEducationEntity({
    required this.id,
    required this.level,
    required this.school_college_id,
    required this.board_or_university,
    required this.course_id,
    required this.specialization_id,
    required this.start_year,
    required this.end_year,
    required this.percentage_or_cgpa,
    required this.education_certificate,
    this.schoolCollege,
    this.course,
    this.specialization,
  });
}

class SchoolCollegeEntity {
  final String name;
  final String? logo_pic;

  SchoolCollegeEntity({
    required this.name,
    this.logo_pic,
  });
}

class UDCourseEntity {
  final String name;

  UDCourseEntity({required this.name});
}

class UDSpecializationEntity {
  final String name;

  UDSpecializationEntity({required this.name});
}

class ProfileSkillEntity {
  final String domain;
  final List<String> subSkills;
  final List<String> authority;
  final List<String> certificateImages;

  ProfileSkillEntity({
    required this.domain,
    required this.subSkills,
    required this.authority,
    required this.certificateImages,
  });
}

class CompanyRecruiterProfileEntity {
  final String company_name;
  final String? logo_url;

  CompanyRecruiterProfileEntity({
    required this.company_name,
    this.logo_url,
  });
}

class UserExperienceEntity {
  final int id;
  final int user_detail_id;
  final int? company_recruiter_profile_id;
  final String? start_date;
  final String? end_date;
  final String? current_job_role;
  final String? current_company;
  final String? status;
  final String? experienceCertificate;
  final DateTime created_at;
  final DateTime updated_at;
  final CompanyRecruiterProfileEntity? companyRecruiterProfile;

  UserExperienceEntity({
    required this.id,
    required this.user_detail_id,
    this.company_recruiter_profile_id,
    this.start_date,
    this.end_date,
    this.current_job_role,
    this.current_company,
    this.status,
    this.experienceCertificate,
    required this.created_at,
    required this.updated_at,
    this.companyRecruiterProfile,
  });
}
