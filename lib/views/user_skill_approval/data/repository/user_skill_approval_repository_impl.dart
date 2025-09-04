// .dart

import '../../domain/entities/user_skill_approval_entity.dart';
import '../../domain/repository/user_skill_approval_repository.dart';
import '../data_sources/user_skill_approval_api_service.dart';

class UserSkillApprovalRepositoryImpl implements UserSkillApprovalRepository {
  final UserSkillApprovalApiService apiService;

  UserSkillApprovalRepositoryImpl(this.apiService);

  @override
  Future<UserSkillApprovalEntity> getUserSkills(int userId) async {
    try {
      final response = await apiService.getUserSkills(userId);
      return UserSkillApprovalEntity(
        id: response.id,
        skills: response.skills
            .map((e) => SkillEntity(
          skill: e.skill,
          authority: e.authority,
          skillId: e.skillId,
        ))
            .toList(),
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> updateUserSkills(int userId, Map<String, dynamic> body) async {
    try {
      await apiService.updateUserSkills(userId, body);
      return true;
    } on Exception {
      return false;
    }
  }
}