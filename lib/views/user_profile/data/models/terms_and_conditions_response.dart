import 'package:job_portal/views/user_profile/domain/entities/terms_and_conditions_entity.dart';

class TermsAndConditionModel extends TermsAndConditionEntity {
  TermsAndConditionModel({required super.termsAndCondition});

  factory TermsAndConditionModel.fromJson(Map<String, dynamic> json) {
    return TermsAndConditionModel(
      termsAndCondition: json['termsAndCondition'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'termsAndCondition': termsAndCondition,
    };
  }
}
