import 'dart:convert';
import 'dart:developer' as developer show log;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/detailed_signup_student/data/data_source/detailed_api_service.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/basic_user_data_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/colleges_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/courses_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/job_roles_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/skill_submission_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/specialization_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/submit_detailed_user_profile.dart';
import 'package:job_portal/views/detailed_signup_student/domain/entities/metadata_entities.dart';
import 'package:job_portal/views/detailed_signup_student/domain/repository/detailed_signup_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailedSignupRepositoryImpl extends DetailedSignupRepository {
  final DetailedApiService _apiService;

  DetailedSignupRepositoryImpl(this._apiService);

  @override
  Future<DataState<dynamic>> getMasterAllData() async {
    try {
      final response = await _apiService.getMasterAllData();
      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
          requestOptions: response.response.requestOptions,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<BasicUserInfoResponse>> getBasicUserInfo(
      Map<String, dynamic> emailMap) async {
    final String email = emailMap['email'] ?? '';
    try {
      final res = await _apiService.getBasicUserInfo(email); // ← Pass email string
      if (res.response.statusCode == HttpStatus.ok) {
        developer.log('.checkk response in repository : ${res.data.message}');
        return DataSuccess(res.data);
      } else {
        developer.log('..checkk response in repository : ${res.data.message}');
        return DataFailed(DioException(
          error: res.response.statusMessage,
          response: res.response,
          type: DioExceptionType.badResponse,
          requestOptions: res.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      developer.log('....checkk DioException: ${e.type}');
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<CollegeListEntity>> getColleges() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData != null) {
        final Map<String, dynamic> masterData = jsonDecode(cachedMasterData);

        if (masterData.containsKey('data') && masterData['data'].containsKey('schoolColleges')) {
          final List<dynamic> collegeJsonList = masterData['data']['schoolColleges'];
          final List<CollegeEntity> colleges = collegeJsonList
              .map((e) => CollegeEntity(
            id: e['id'],
            name: e['name'],
            logo_pic: e['logo_pic'] ?? '',
          ))
              .toList();

          return DataSuccess(CollegeListEntity(
            success: true,
            colleges: colleges,
            message: 'Colleges loaded from cache',
          ));
        }
      }

      // Fallback to API — use dummy emailMap if required by API
      final res = await _apiService.getColleges({'email': 'fallback@fallback.com'});
      if (res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(res.data);
      } else {
        return DataFailed(DioException(
          requestOptions: res.response.requestOptions,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      developer.log('Error loading colleges from cache: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<List<SpecializationEntity>>> getSpecialization(String course_id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData != null) {
        final Map<String, dynamic> masterData = jsonDecode(cachedMasterData);

        if (masterData.containsKey('data') && masterData['data'].containsKey('specializations')) {
          final List<dynamic> specializationJsonList = masterData['data']['specializations'];
          final List<SpecializationEntity> specializations = specializationJsonList
              .where((e) => e['course_id'].toString() == course_id)
              .map((e) => SpecializationEntity(
            id: e['id'],
            name: e['name'],
            course_id: e['course_id'],
            course: e['course'] != null
                ? SCourseEntity(name: e['course']['name'])
                : null,
          ))
              .toList();

          if (specializations.isNotEmpty) {
            return DataSuccess(specializations);
          } else {
            developer.log('⚠️ No specializations found in cache for course_id: $course_id');
          }
        }
      }

      // Fallback to API
      final res = await _apiService.getSpecialization(course_id);
      if (res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(res.data.data);
      } else {
        return DataFailed(DioException(
          requestOptions: res.response.requestOptions,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      developer.log('Error loading specializations from cache: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<CourseListEntity>> getCourses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData != null) {
        final Map<String, dynamic> masterData = jsonDecode(cachedMasterData);

        if (masterData.containsKey('data') && masterData['data'].containsKey('courses')) {
          final List<dynamic> courseJsonList = masterData['data']['courses'];
          final List<CourseModel> courses = courseJsonList
              .map((e) => CourseModel(id: e['id'], name: e['name']))
              .toList();

          final courseListEntity = CourseListEntity(
            success: true,
            courses: courses,
            message: 'Courses loaded from cache',
          );

          return DataSuccess(courseListEntity);
        }
      }

      // Fallback to API if cache missing
      final res = await _apiService.getCourses();
      if (res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(res.data);
      } else {
        return DataFailed(DioException(
          requestOptions: res.response.requestOptions,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      developer.log('Error loading courses from cache: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<LocationListEntity>> getLocations() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData != null) {
        final Map<String, dynamic> masterData = jsonDecode(cachedMasterData);

        if (masterData.containsKey('data') && masterData['data'].containsKey('locations')) {
          final List<dynamic> locationJsonList = masterData['data']['locations'];
          final List<LocationEntity> locations = locationJsonList
              .map((e) => LocationEntity(id: e['id'], name: e['name']))
              .toList();

          final locationListEntity = LocationListEntity(
            success: true,
            locations: locations,
            message: 'Locations loaded from cache',
          );

          return DataSuccess(locationListEntity);
        }
      }

      // Fallback to API if cache missing
      final response = await _apiService.getLocations();
      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
          requestOptions: response.response.requestOptions,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      developer.log('Error loading locations from cache: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<JobRolesListResponse>> getJobRoles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData != null) {
        final Map<String, dynamic> masterData = jsonDecode(cachedMasterData);

        if (masterData.containsKey('data') && masterData['data'].containsKey('jobRoles')) {
          final List<dynamic> jobRoleJsonList = masterData['data']['jobRoles'];
          final List<String> jobRoles = jobRoleJsonList
              .map((e) => e['title'] as String)
              .toList();

          final jobRolesListResponse = JobRolesListResponse(jobRoles: jobRoles);

          return DataSuccess(jobRolesListResponse);
        }
      }

      // Fallback to API
      final res = await _apiService.getJobRoles();
      if (res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(res.data);
      } else {
        return DataFailed(DioException(
          requestOptions: res.response.requestOptions,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      developer.log('Error loading jobRoles from cache: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<CompanyListEntity>> getCompanies() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData != null) {
        final Map<String, dynamic> masterData = jsonDecode(cachedMasterData);
        if (masterData.containsKey('data') && masterData['data'].containsKey('companies')) {
          final List<dynamic> companyJsonList = masterData['data']['companies'];
          final List<CompanyEntity> companies = companyJsonList
              .map((e) => CompanyEntity(
            id: e['id'],
            company_name: e['company_name'],
          ))
              .toList();
          return DataSuccess(CompanyListEntity(companies: companies));
        }
      }

      return DataSuccess(const CompanyListEntity(companies: []));
    } catch (e) {
      developer.log('Error loading companies from cache: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<SubmitDetailedUserProfile>> submitDetailedUserProfile(
      Map<String, dynamic> params) async {
    try {

      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData == null) {
        developer.log('⚠️ No cached master data found. Proceeding without ID mapping.');
      }

      final Map<String, dynamic>? masterData = cachedMasterData != null
          ? jsonDecode(cachedMasterData)['data']
          : null;

      final String? courseName = params['course'];
      int? courseId;
      if (courseName != null && masterData != null && masterData.containsKey('courses')) {
        try {
          final courseMatch = (masterData['courses'] as List).firstWhere((c) => c['name'] == courseName);
          courseId = courseMatch['id'];
          params['course_id'] = courseId;
          developer.log('✅ Mapped course "$courseName" → course_id: $courseId');
        } on StateError {
          developer.log('❌ No course found for name: $courseName');
        }
      }

      final String? specializationName = params['specialization'];
      int? specializationId;
      if (specializationName != null &&
          courseId != null &&
          masterData != null &&
          masterData.containsKey('specializations')) {
        try {
          final specializationMatch = (masterData['specializations'] as List).firstWhere((s) =>
          s['name'] == specializationName && s['course_id'] == courseId);
          specializationId = specializationMatch['id'];
          params['specialization_id'] = specializationId;
          developer.log('✅ Mapped specialization "$specializationName" → specialization_id: $specializationId');
        } on StateError {
          developer.log('❌ No specialization found for: $specializationName (course_id: $courseId)');
        }
      }

      final String? collegeName = params['college_name'];
      if (collegeName != null) {
        params['college_name'] = collegeName;
        developer.log('📎 College name included: $collegeName');
      }

      params['start_year'] = params['start_year']?.toString();
      params['end_year'] = params['end_year']?.toString();

      developer.log('📊 Final Payload to API: ${jsonEncode(params)}');

      final res = await _apiService.submitDetailedUserProfile(params);
      if (res.response.statusCode == HttpStatus.ok ||
          res.response.statusCode == HttpStatus.created ||
          res.response.statusCode == HttpStatus.conflict) {
        developer.log('.checkk response in repository : ${res.data}');
        return DataSuccess(res.data);
      } else {
        developer.log('..checkk response in repository : ${res.data}');
        return DataFailed(DioException(
          error: res.response.statusMessage,
          response: res.response,
          type: DioExceptionType.badResponse,
          requestOptions: res.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      final error = e.type;
      developer.log('....checkk DioException: $error');
      if (error == DioExceptionType.badResponse && e.response != null) {
        developer.log('...checkk bad response data: ${e.response!.data}');
        try {
          final data = SubmitDetailedUserProfile.fromJson(e.response!.data);
          return DataSuccess(data);
        } catch (jsonError) {
          developer.log('Failed to parse error response: $jsonError');
        }
      }
      return DataFailed(e);
    } catch (e) {
      developer.log('Unexpected error in submitDetailedUserProfile: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }
}
