import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/detailed_signup_student/data/data_source/detailed_api_service.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/domian_all_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/skill_submission_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/subskill_response.dart';
import 'package:job_portal/views/detailed_signup_student/domain/entities/metadata_entities.dart';
import 'package:job_portal/views/detailed_signup_student/domain/repository/skill_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SkillRepositoryImpl extends SkillRepository {
  final DetailedApiService apiService;
  SkillRepositoryImpl(this.apiService);

  @override
  Future<DataState<DomainListEntity>> getDomains() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData != null) {
        final Map<String, dynamic> masterData = jsonDecode(cachedMasterData);

        if (masterData.containsKey('data') && masterData['data'].containsKey('domains')) {
          final List<dynamic> domainJsonList = masterData['data']['domains'];
          final List<DomainEntity> domains = domainJsonList
              .map((e) => DomainEntity(
            id: e['domain_id'],
            name: e['domain_name'],
          ))
              .toList();

          return DataSuccess(DomainListEntity(domains: domains));
        }
      }

      // Fallback to API
      final response = await apiService.getDomains();
      if (response.response.statusCode == HttpStatus.ok) {
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
      developer.log('Error loading domains from cache: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<SkillListEntity>> getSubSkills(String domain) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedMasterData = prefs.getString('master_api_all_data');

      if (cachedMasterData != null) {
        final Map<String, dynamic> masterData = jsonDecode(cachedMasterData);

        if (masterData.containsKey('data') && masterData['data'].containsKey('skillsByDomain')) {
          final List<dynamic> skillsByDomainList = masterData['data']['skillsByDomain'];

          // Find the domain with matching domain_id
          final domainSkills = skillsByDomainList
              .where((e) => e['domain_id'].toString() == domain)
              .map((e) => e['skills'] as List<dynamic>)
              .expand((list) => list) // flatten
              .map((e) => SkillEntity(
            id: e['skill_id'],
            name: e['skill_name'],
          ))
              .toList();

          if (domainSkills.isNotEmpty) {
            return DataSuccess(SkillListEntity(skills: domainSkills));
          } else {
            developer.log('⚠️ No subskills found in cache for domain_id: $domain');
          }
        }
      }

      // Fallback to API
      final response = await apiService.getSubSkills(domain);
      if (response.response.statusCode == HttpStatus.ok) {
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
      developer.log('Error loading subskills from cache: $e');
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<SkillSubmitionResponse>> submitSkillsAndCertificates(
      Map<String, dynamic> data) async {
    try {
      final response = await apiService.submitSkillsAndCertificates(data);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
            requestOptions: response.response.requestOptions,
            type: DioExceptionType.badResponse,
            error: response.response.statusMessage,
            response: response.response));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
