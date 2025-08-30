// class CollegesListResponse {
//   final List<String> colleges;

//   CollegesListResponse({required this.colleges});

//   factory CollegesListResponse.fromJson(List<dynamic> json) {
//     return CollegesListResponse(
//       colleges: List<String>.from(json),
//     );
//   }

//   List<dynamic> toJson() {
//     return colleges;
//   }
// }

// college_model.dart
import 'package:job_portal/views/detailed_signup_student/domain/entities/metadata_entities.dart';

class CollegeModel extends CollegeEntity {
  const CollegeModel({
    required int id,
    required String name,
    required String logoPic,
  }) : super(id: id, name: name, logoPic: logoPic);

  factory CollegeModel.fromJson(Map<String, dynamic> json) {
    return CollegeModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logoPic: json['logoPic'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoPic': logoPic,
    };
  }
}

class CollegeListModel extends CollegeListEntity {
  const CollegeListModel({
    required bool success,
    required List<CollegeEntity> colleges,
    required String message,
  }) : super(success: success, colleges: colleges, message: message);

  factory CollegeListModel.fromJson(Map<String, dynamic> json) {
    return CollegeListModel(
      success: json['success'] ?? false,
      colleges: (json['data'] as List<dynamic>?)
              ?.map((e) => CollegeModel.fromJson(e))
              .toList() ??
          [],
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': colleges
          .map((college) => CollegeModel(
                id: college.id,
                name: college.name,
                logoPic: college.logoPic,
              ).toJson())
          .toList(),
      'message': message,
    };
  }
}
