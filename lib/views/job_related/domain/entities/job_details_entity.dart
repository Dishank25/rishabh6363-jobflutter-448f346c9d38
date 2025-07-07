class JobDetailsEntity {
  final int jobId;
  final String opportunityType;
  final String jobType;
  final String jobProfile;
  final String jobDescription;
  final String jobTime;
  final int daysInOffice;
  final String cityChoice;
  final List<String> skillsRequired;
  final String skillRequiredNote;
  final String candidatePreferences;
  final bool womenPreferred;
  final String companyName;
  final String logoUrl;
  final String aboutCompany;
  final String companyIndustry;
  final String companyLocation;
  final String recruiterName;
  final String recruiterEmail;
  final String recruiterPhone;
  final String recruiterDesignation;
  final String recruiterProfilePic;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final bool isGstVerified;
  final int numberOfOpenings;
  final String hiringStatus;
  final String hiringPreferences;
  final String languagesKnown;
  final String salary;
  final String stipendType;
  final String incentivePerYear;
  final List<String> perks;
  final String internshipDuration;
  final String internshipStartDate;
  final String internshipFromDate;
  final String internshipToDate;
  final bool isCustomInternshipDate;
  final String? collegeName;
  final String? course;
  final String phoneContact;
  final String alternatePhoneNumber;
  final List<String> screeningQuestions;
  final int numberOfApplicants;
  final String postedDaysAgo;

  const JobDetailsEntity({
    required this.jobId,
    required this.opportunityType,
    required this.jobType,
    required this.jobProfile,
    required this.jobDescription,
    required this.jobTime,
    required this.daysInOffice,
    required this.cityChoice,
    required this.skillsRequired,
    required this.skillRequiredNote,
    required this.candidatePreferences,
    required this.womenPreferred,
    required this.companyName,
    required this.logoUrl,
    required this.aboutCompany,
    required this.companyIndustry,
    required this.companyLocation,
    required this.recruiterName,
    required this.recruiterEmail,
    required this.recruiterPhone,
    required this.recruiterDesignation,
    required this.recruiterProfilePic,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.isGstVerified,
    required this.numberOfOpenings,
    required this.hiringStatus,
    required this.hiringPreferences,
    required this.languagesKnown,
    required this.salary,
    required this.stipendType,
    required this.incentivePerYear,
    required this.perks,
    required this.internshipDuration,
    required this.internshipStartDate,
    required this.internshipFromDate,
    required this.internshipToDate,
    required this.isCustomInternshipDate,
    this.collegeName,
    this.course,
    required this.phoneContact,
    required this.alternatePhoneNumber,
    required this.screeningQuestions,
    required this.numberOfApplicants,
    required this.postedDaysAgo,
  });
}
