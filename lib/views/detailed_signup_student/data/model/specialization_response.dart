import 'package:job_portal/views/detailed_signup_student/domain/entities/metadata_entities.dart';

class SpecializationResponse {
  final bool success;
  final List<SpecializationModel> data;
  final String message;

  SpecializationResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  factory SpecializationResponse.fromJson(Map<String, dynamic> json) {
    return SpecializationResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List)
          .map((item) => SpecializationModel.fromJson(item))
          .toList(),
      message: json['message'] ?? '',
    );
  }
}

class SpecializationModel extends SpecializationEntity {
  SpecializationModel({
    required super.id,
    required super.name,
    required super.courseId,
    required super.course,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(
      id: json['id'],
      name: json['name'],
      courseId: json['courseId'],
      course: SCourseModel.fromJson(json['Course']),
    );
  }
}

class SCourseModel extends SCourseEntity {
  SCourseModel({
    required super.name,
  });

  factory SCourseModel.fromJson(Map<String, dynamic> json) {
    return SCourseModel(
      name: json['name'] ?? '',
    );
  }
}
