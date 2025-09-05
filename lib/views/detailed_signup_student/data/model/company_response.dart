import 'package:job_portal/views/detailed_signup_student/domain/entities/metadata_entities.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({required super.id, required super.company_name});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      company_name: json['company_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_name': company_name,
    };
  }
}

class CompanyListResponse {
  final bool success;
  final List<CompanyModel> data;
  final String message;

  const CompanyListResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  factory CompanyListResponse.fromJson(Map<String, dynamic> json) {
    return CompanyListResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List).map((e) => CompanyModel.fromJson(e)).toList(),
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
      'message': message,
    };
  }
}