// ignore_for_file: constant_identifier_names

enum USERTYPE {
  STUDENT,
  COMPANY,
  UNIVERSITY,
}

enum JOBSEEKERTYPE {
  SchoolStudent,
  CollegeStudent,
  Fresher,
  WorkingProffesional,
}

enum DETAILEDPROFILEPARAMS {
  userId,
  email,
  firstName,
  lastName,
  phone,
  dob,
  city,
  jobLocation,
  gender,
  languages,
  userType,

  // school student
  educationStandard,

  // college student / fresher
  course,
  collegeName,
  specialization,
  startYear,
  endYear,

  // Working professionals
  experiences,
  companyRecruiterProfileId,
  jobRole,
  company,
  startDate,
  endDate,
  description,

  // preference page
  currentlyLookingFor,
  workMode,

  // verification info
  aboutus,
  careerObjective,
  resume,
  isEmailVerified,
  isPhoneVerified,
  isGstVerified,
  userprofilepic,
  aadhaarNumber,
  aadhaarCardFile,
  isAadhaarVerified,
}

// Map<String, dynamic> payload = {
//   "userId": 58,
//   "firstName": "Megha",
//   "lastName": "Gupta",
//   "email": "a@gmail.com",
//   "phone": "58798598",
//   "dob": "1990-01-01",
//   "city": "Delhi",
//   "gender": "Female",
//   "userType": "Working Professional",
//   "jobLocation": "San Francisco",
//   "experiences": [
//     {
//       "userId": 57,
//       "companyRecruiterProfileId": "4",
//       "jobRole": "Software Engineer",
//       "company": "OriginCore",
//       "startDate": "2022-01-01",
//       "endDate": "2023-01-01",
//       "description": "Worked on backend development"
//     }
//   ],
//   "salaryDetails": "100000",
//   "currentlyLookingFor": "job",
//   "workMode": "Remote"
// };
// submit detailed profile params
// enum DETAILEDPROFILEPARAMS {
//   userId,
//   firstName,
//   lastName,
//   email,
//   phone,
//   dob,
//   city,
//   gender,
//   languages,
//   userType,
//   jobLocation,
//   experiences,
//   companyRecruiterProfileId,
//   jobRole,
//   company,
//   startDate,
//   endDate,
//   description,
//   salaryDetails,
//   currentlyLookingFor,
//   workMode,
// }
