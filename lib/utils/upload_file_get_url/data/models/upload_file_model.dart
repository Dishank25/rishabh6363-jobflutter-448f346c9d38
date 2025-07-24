import 'package:job_portal/utils/upload_file_get_url/domain/entities/upload_file_entity.dart';

class UploadFileModel extends UploadFileEntity {
  const UploadFileModel({required super.message});

  factory UploadFileModel.fromJson(Map<String, dynamic> json) {
    return UploadFileModel(
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
