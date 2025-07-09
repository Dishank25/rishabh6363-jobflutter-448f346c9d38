import 'package:job_portal/views/job_related/domain/entities/all_jobs_entity.dart';

class AllJobsResponse {
  final List<JobModel> data;

  AllJobsResponse({required this.data});

  factory AllJobsResponse.fromJson(Map<String, dynamic> json) {
    return AllJobsResponse(
      data: List<JobModel>.from(
          json['data'].map((item) => JobModel.fromJson(item))),
    );
  }
}

class JobModel extends AllJobsEntity {
  JobModel({
    required super.jobId,
    required super.companyRecruiterProfileId,
    required super.jobProfile,
    required super.companyName,
    required super.logoUrl,
    required super.hiringStatus,
    required super.postedDaysAgo,
    required super.matchPercentage,
    required super.experience,
    required super.salary,
    required super.cityChoice,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      jobId: json['jobId'],
      companyRecruiterProfileId: json['companyRecruiterProfileId'],
      jobProfile: json['jobProfile'],
      companyName: json['companyName'],
      logoUrl: json['logoUrl'],
      hiringStatus: json['hiringStatus'],
      postedDaysAgo: json['postedDaysAgo'],
      matchPercentage: json['matchPercentage'],
      experience: json['experience'],
      salary: json['salary'],
      cityChoice: json['cityChoice'],
    );
  }
}

// class AllJobsResponse extends AllJobsEntity {
//   const AllJobsResponse({
//     required super.jobId,
//     required super.companyRecruiterProfileId,
//     required super.opportunityType,
//     required super.skillsRequired,
//     required super.skillRequiredNote,
//     required super.jobType,
//     super.jobTime,
//     super.daysInOffice,
//     super.cityChoice,
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
//     super.internshipFromDate,
//     super.internshipToDate,
//     required super.isCustomInternshipDate,
//     required super.collegeName,
//     required super.course,
//     required super.alternatePhoneNumber,
//     required super.views,
//     super.userId,
//     required super.jobProfile,
//     required super.companyName,
//     required super.logoUrl,
//     required super.hiringStatus,
//     required super.postedDaysAgo,
//     required super.matchPercentage,
//     required super.experience,
//     required super.salary,
//   });

//   factory AllJobsResponse.fromJson(Map<String, dynamic> json) {
//     return AllJobsResponse(
//       jobId: json['jobId'],
//       companyRecruiterProfileId: json['companyRecruiterProfileId'],
//       opportunityType: json['opportunityType'],
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
//       stipendType: json['stipendType'],
//       stipendMin: json['stipendMin'],
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
//       views: json['views'],
//       userId: json['userId'],
//       jobProfile: json['jobProfile'],
//       companyName: json['companyName'],
//       logoUrl: json['logoUrl'],
//       hiringStatus: json['hiringStatus'],
//       postedDaysAgo: json['postedDaysAgo'],
//       matchPercentage: json['matchPercentage'],
//       experience: json['experience'],
//       salary: json['salary'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'jobId': jobId,
//       'companyRecruiterProfileId': companyRecruiterProfileId,
//       'opportunityType': opportunityType,
//       'skillsRequired': skillsRequired,
//       'skillRequiredNote': skillRequiredNote,
//       'jobType': jobType,
//       'jobTime': jobTime,
//       'daysInOffice': daysInOffice,
//       'cityChoice': cityChoice,
//       'numberOfOpenings': numberOfOpenings,
//       'jobDescription': jobDescription,
//       'candidatePreferences': candidatePreferences,
//       'womenPreferred': womenPreferred,
//       'stipendType': stipendType,
//       'stipendMin': stipendMin,
//       'stipendMax': stipendMax,
//       'incentivePerYear': incentivePerYear,
//       'perks': perks,
//       'screeningQuestions': screeningQuestions,
//       'phoneContact': phoneContact,
//       'internshipDuration': internshipDuration,
//       'internshipStartDate': internshipStartDate,
//       'internshipFromDate': internshipFromDate,
//       'internshipToDate': internshipToDate,
//       'isCustomInternshipDate': isCustomInternshipDate,
//       'collegeName': collegeName,
//       'course': course,
//       'alternatePhoneNumber': alternatePhoneNumber,
//       'views': views,
//       'userId': userId,
//       'jobProfile': jobProfile,
//       'companyName': companyName,
//       'logoUrl': logoUrl,
//       'hiringStatus': hiringStatus,
//       'postedDaysAgo': postedDaysAgo,
//       'matchPercentage': matchPercentage,
//       'experience': experience,
//       'salary': salary,
//     };
//   }
// }
