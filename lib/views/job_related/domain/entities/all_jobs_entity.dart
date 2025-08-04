class AllJobsEntity {
  final int jobId;
  final int companyRecruiterProfileId;
  final String jobProfile;
  final String companyName;
  final String? logoUrl;
  final String hiringStatus;
  final String postedDaysAgo;
  final int matchPercentage;
  final String experience;
  final String salary;
  final String? cityChoice;

  const AllJobsEntity({
    required this.jobId,
    required this.companyRecruiterProfileId,
    required this.jobProfile,
    required this.companyName,
    required this.logoUrl,
    required this.hiringStatus,
    required this.postedDaysAgo,
    required this.matchPercentage,
    required this.experience,
    required this.salary,
    required this.cityChoice,
  });
}

// "data": [
//         {
//             "jobId": 2,
//             "companyRecruiterProfileId": 1,
//             "opportunityType": "internship",
//             "skillsRequired": "react.js, Node.js",
//             "skillRequiredNote": "1 year experience",
//             "jobType": "partime",
//             "jobTime": null,
//             "daysInOffice": null,
//             "cityChoice": null,
//             "numberOfOpenings": 2,
//             "jobDescription": "Exciting internship opportunity",
//             "candidatePreferences": "Motivated learners",
//             "womenPreferred": false,
//             "stipendType": "Paid",
//             "stipendMin": 1000,
//             "stipendMax": 2000,
//             "incentivePerYear": "500",
//             "perks": "Flexible hours",
//             "screeningQuestions": "Why do you want this internship?",
//             "phoneContact": "1234567890",
//             "internshipDuration": "3 months",
//             "internshipStartDate": "2024-07-01",
//             "internshipFromDate": null,
//             "internshipToDate": null,
//             "isCustomInternshipDate": false,
//             "collegeName": "ABC University",
//             "course": "B.Tech",
//             "alternatePhoneNumber": "",
//             "views": 0,
//             "userId": null,
//             "jobProfile": "Software Developer",
//             "companyName": "Acme Corp",
//             "logoUrl": "https://encrypted-tbn0.gstatic.com/image.jpg",
//             "hiringStatus": "Actively Hiring",
//             "postedDaysAgo": "56",
//             "matchPercentage": 0,
//             "experience": "Motivated learners",
//             "salary": "1000 - 2000"
//         },

// class AllJobsEntity {
//   final int jobId;
//   final int companyRecruiterProfileId;
//   final String opportunityType;
//   final String skillsRequired;
//   final String skillRequiredNote;
//   final String jobType;
//   final String? jobTime;
//   final int? daysInOffice;
//   final String? cityChoice;
//   final int numberOfOpenings;
//   final String jobDescription;
//   final String candidatePreferences;
//   final bool womenPreferred;
//   final String stipendType;
//   final int stipendMin;
//   final int stipendMax;
//   final String incentivePerYear;
//   final String perks;
//   final String screeningQuestions;
//   final String phoneContact;
//   final String internshipDuration;
//   final String internshipStartDate;
//   final String? internshipFromDate;
//   final String? internshipToDate;
//   final bool isCustomInternshipDate;
//   final String collegeName;
//   final String course;
//   final String alternatePhoneNumber;
//   final int views;
//   final int? userId;
//   final String jobProfile;
//   final String companyName;
//   final String logoUrl;
//   final String hiringStatus;
//   final String postedDaysAgo;
//   final int matchPercentage;
//   final String experience;
//   final String salary;

//   const AllJobsEntity({
//     required this.jobId,
//     required this.companyRecruiterProfileId,
//     required this.opportunityType,
//     required this.skillsRequired,
//     required this.skillRequiredNote,
//     required this.jobType,
//     this.jobTime,
//     this.daysInOffice,
//     this.cityChoice,
//     required this.numberOfOpenings,
//     required this.jobDescription,
//     required this.candidatePreferences,
//     required this.womenPreferred,
//     required this.stipendType,
//     required this.stipendMin,
//     required this.stipendMax,
//     required this.incentivePerYear,
//     required this.perks,
//     required this.screeningQuestions,
//     required this.phoneContact,
//     required this.internshipDuration,
//     required this.internshipStartDate,
//     this.internshipFromDate,
//     this.internshipToDate,
//     required this.isCustomInternshipDate,
//     required this.collegeName,
//     required this.course,
//     required this.alternatePhoneNumber,
//     required this.views,
//     this.userId,
//     required this.jobProfile,
//     required this.companyName,
//     required this.logoUrl,
//     required this.hiringStatus,
//     required this.postedDaysAgo,
//     required this.matchPercentage,
//     required this.experience,
//     required this.salary,
//   });
// }
