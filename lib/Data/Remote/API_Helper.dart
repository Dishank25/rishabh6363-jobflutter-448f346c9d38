import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart'as http;
import 'package:job_portal/Data/Remote/App_URLS.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc State Management/Courses Names API/Course Model/Course Model.dart';
import '../../Bloc State Management/Domain Skills API/Domain Model/Domain Model.dart';
import '../../Bloc State Management/Related Skills API/Related Skills Model/Related Skills Model.dart';
import 'API_Exceptions.dart';

class ApiHelper {
  Future<dynamic> postAPI({
    required String Url,
    bool isHeaderRequired = true,
    Map<String, String>? mHeaders,
    Map<String, dynamic>? mBodyParams,
  }) async {
    try {
      mHeaders ??= {};
      if (isHeaderRequired) {
        mHeaders['Content-Type'] = 'application/json';
      }

      final res = await http.post(
        Uri.parse(Url),
        body: mBodyParams != null ? jsonEncode(mBodyParams) : null,
        headers: mHeaders,
      )
          .timeout(const Duration(seconds: 15));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return returnJsonResponse(res);
      }
    } on SocketException catch (e) {
      print("SocketException: $e");
      throw FetchDataException(
          ErrorMsg: "No Internet connection. Please check your connection and try again.");
    }
  }


  dynamic returnJsonResponse(http.Response response) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    switch (response.statusCode) {
      case 200:
      case 201:
        {
          var mData = jsonDecode(response.body);
          return mData;
        }
      case 400:
        throw BadRequestException(ErrorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnAuthorizedRequestException(ErrorMsg: response.body.toString());
      case 409:
        throw BadRequestException(ErrorMsg: "User already exist");
      case 500:
      default:
        throw FetchDataException(
            ErrorMsg: "Error occured while communication with server Status Code : ${response
                .statusCode}");
    }
  }
}


/// COURSE REPOSITORY
class CourseRepository {
  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse(AppUrls.FetchCourses));

    if (response.statusCode == 200 || response.statusCode==201) {
      final data = json.decode(response.body) as List;
      return data.map((e) => Course.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}


/// COLLEGE REPOSITORY
class CollegeRepository {
  Future<List<String>> fetchColleges() async {
    final response = await http.get(Uri.parse(AppUrls.FetchColleges));

    if (response.statusCode == 200|| response.statusCode==201) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<String>();
    } else {
      throw Exception('Failed to load colleges');
    }
  }
}

/// SPECIALIZATION REPOSITORY
class SpecializationRepository {
  Future<List<String>> fetchSpecializations() async {
    final response = await http.get(Uri.parse(AppUrls.FetchSpecializationsURL));

    if (response.statusCode == 200|| response.statusCode==201) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<String>();
    } else {
      throw Exception('Failed to load specializations');
    }
  }
}

/// JOB ROLE REPOSITORY
class JobRoleRepository {
  Future<List<String>> fetchJobRoles() async {
    final response = await http.get(Uri.parse(AppUrls.FetchJobRolesURL));

    if (response.statusCode == 200 || response.statusCode==201) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.cast<String>();
    } else {
      throw Exception('Failed to fetch job roles');
    }
  }
}

/// JOB LOCATIONS REPOSITORY
class JobLocationRepository {
  Future<List<String>> fetchJobLocations() async {
    final response = await http.get(Uri.parse(AppUrls.FetchJobLocationsURL));

    if (response.statusCode == 200 || response.statusCode==201) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.cast<String>();
    } else {
      throw Exception('Failed to fetch job locations');
    }
  }
}

/// Domain Skills Repository

class DomainRepository {
  final String token;
  DomainRepository(this.token);

  Future<List<DomainModel>> fetchDomains() async {
    final response = await http.get(
      Uri.parse(AppUrls.FetchDomainSkills),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200||response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final List domains = data['domains'];
      return domains.map((json) => DomainModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch domains');
    }
  }
}

/// Related Skills Repo

class RelatedSkillsRepository {
  Future<List<RelatedSkillModel>> fetchSkillsByDomain(String domainName) async{
    final response = await http.get(
      Uri.parse(AppUrls.relatedSkillsURL),
      headers: {
        'Content-Type': 'application/json',

      },
    );
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200|| response.statusCode == 201) {
      final List data = jsonDecode(response.body)['skills'];
      return data.map((e) => RelatedSkillModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load related skills");
    }
  }
}