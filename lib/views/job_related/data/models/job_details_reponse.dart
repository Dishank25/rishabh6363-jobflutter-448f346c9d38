import 'package:job_portal/views/job_related/domain/entities/job_details_entity.dart';

// class JobDetailsResponseModel extends JobDetailsEntity {
//   JobDetailsResponseModel({
//     required super.jobId,
//     required super.companyRecruiterProfileId,
//     required super.opportunityType,
//     required super.jobProfile,
//     required super.skillsRequired,
//     required super.skillRequiredNote,
//     required super.jobType,
//     required super.jobTime,
//     required super.daysInOffice,
//     required super.cityChoice,
//     required super.numberOfOpenings,
//     required super.jobDescription,
//     required super.candidatePreferences,
//     required super.womenPreferred,
//     required super.stipendType,
//     required super.stipendMin,
//     required super.stipendMax,
//     required super.incentivePerYear,
//     required super.perks,
//     required super.screeningQuestions,
//     required super.phoneContact,
//     required super.internshipDuration,
//     required super.internshipStartDate,
//     required super.internshipFromDate,
//     required super.internshipToDate,
//     required super.isCustomInternshipDate,
//     required super.collegeName,
//     required super.course,
//     required super.alternatePhoneNumber,
//     required super.views,
//     required super.createdAt,
//     required super.updatedAt,
//     required super.userId,
//     required super.companyRecruiterProfile,
//   });

//   factory JobDetailsResponseModel.fromJson(Map<String, dynamic> json) {
//     return JobDetailsResponseModel(
//       jobId: json['jobId'],
//       companyRecruiterProfileId: json['companyRecruiterProfileId'],
//       opportunityType: json['opportunityType'],
//       jobProfile: json['jobProfile'],
//       skillsRequired: json['skillsRequired'],
//       skillRequiredNote: json['skillRequiredNote'],
//       jobType: json['jobType'],
//       jobTime: json['jobTime'],
//       daysInOffice: json['daysInOffice'],
//       cityChoice: json['cityChoice'],
//       numberOfOpenings: json['numberOfOpenings'],
//       jobDescription: json['jobDescription'],
//       candidatePreferences: json['candidatePreferences'],
//       womenPreferred: json['womenPreferred'],
//       stipendType: json['stipendType'] ?? 0,
//       stipendMin: json['stipendMin'] ?? 0,
//       stipendMax: json['stipendMax'],
//       incentivePerYear: json['incentivePerYear'],
//       perks: json['perks'],
//       screeningQuestions: json['screeningQuestions'],
//       phoneContact: json['phoneContact'],
//       internshipDuration: json['internshipDuration'],
//       internshipStartDate: json['internshipStartDate'],
//       internshipFromDate: json['internshipFromDate'],
//       internshipToDate: json['internshipToDate'],
//       isCustomInternshipDate: json['isCustomInternshipDate'],
//       collegeName: json['collegeName'],
//       course: json['course'],
//       alternatePhoneNumber: json['alternatePhoneNumber'],
//       views: json['views'] ?? 0,
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//       userId: json['userId'] ?? 0,
//       companyRecruiterProfile: CompanyRecruiterProfileModel.fromJson(
//           json['CompanyRecruiterProfile']),
//     );
//   }
// }

// class CompanyRecruiterProfileModel extends CompanyRecruiterProfileEntity {
//   CompanyRecruiterProfileModel({
//     required super.companyName,
//     required super.logoUrl,
//     required super.about,
//   });

//   factory CompanyRecruiterProfileModel.fromJson(Map<String, dynamic> json) {
//     return CompanyRecruiterProfileModel(
//       companyName: json['companyName'],
//       logoUrl: json['logoUrl'],
//       about: json['about'],
//     );
//   }
// }

class JobDetailsResponseModel extends JobDetailsEntity {
  JobDetailsResponseModel.fromJson(Map<String, dynamic> json)
      : super(
          jobId: json['jobId'],
          opportunityType: json['opportunityType'],
          jobType: json['jobType'],
          jobProfile: json['jobProfile'],
          jobDescription: json['jobDescription'],
          jobTime: json['jobTime'],
          daysInOffice: json['daysInOffice'],
          cityChoice: json['cityChoice'],
          skillsRequired: List<String>.from(json['skillsRequired'] ?? []),
          skillRequiredNote: json['skillRequiredNote'],
          candidatePreferences: json['candidatePreferences'],
          womenPreferred: json['womenPreferred'],
          companyName: json['companyName'],
          logoUrl: json['logoUrl'],
          aboutCompany: json['aboutCompany'],
          companyIndustry: json['companyIndustry'],
          companyLocation: json['companyLocation'],
          recruiterName: json['recruiterName'],
          recruiterEmail: json['recruiterEmail'],
          recruiterPhone: json['recruiterPhone'],
          recruiterDesignation: json['recruiterDesignation'],
          recruiterProfilePic: json['recruiterProfilePic'],
          isEmailVerified: json['isEmailVerified'],
          isPhoneVerified: json['isPhoneVerified'],
          isGstVerified: json['isGstVerified'],
          numberOfOpenings: json['numberOfOpenings'],
          hiringStatus: json['hiringStatus'],
          hiringPreferences: json['hiringPreferences'],
          languagesKnown: json['languagesKnown'],
          salary: json['salary'],
          stipendType: json['stipendType'],
          incentivePerYear: json['incentivePerYear'],
          perks: List<String>.from(json['perks'] ?? []),
          internshipDuration: json['internshipDuration'],
          internshipStartDate: json['internshipStartDate'],
          internshipFromDate: json['internshipFromDate'],
          internshipToDate: json['internshipToDate'],
          isCustomInternshipDate: json['isCustomInternshipDate'],
          collegeName: json['collegeName'],
          course: json['course'],
          phoneContact: json['phoneContact'],
          alternatePhoneNumber: json['alternatePhoneNumber'],
          screeningQuestions:
              List<String>.from(json['screeningQuestions'] ?? []),
          numberOfApplicants: json['numberOfApplicants'],
          postedDaysAgo: json['postedDaysAgo'],
        );
}
