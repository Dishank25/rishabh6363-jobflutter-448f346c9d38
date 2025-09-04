// user_skill_approval_response_model.dart
class UserSkillApprovalResponseModel {
  final int id;
  final List<SkillModel> skills;

  UserSkillApprovalResponseModel({required this.id, required this.skills});

  factory UserSkillApprovalResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> skillList = json['skills'] ?? [];
    final skills = skillList
        .map((e) => SkillModel.fromJson(e))
        .toList();

    return UserSkillApprovalResponseModel(
      id: json['id'],
      skills: skills,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'skills': skills.map((e) => e.toJson()).toList(),
    };
  }
}

class SkillModel {
  final String skill;
  final String authority;
  final int skillId;

  SkillModel({
    required this.skill,
    required this.authority,
    required this.skillId,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      skill: json['skill'] ?? '',
      authority: json['authority'] ?? '',
      skillId: json['skill_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skill': skill,
      'authority': authority,
      'skill_id': skillId,
    };
  }
}