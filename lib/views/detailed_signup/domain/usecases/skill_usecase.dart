import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/detailed_signup/data/model/domian_all_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/subskill_response.dart';
import 'package:job_portal/views/detailed_signup/domain/repository/skill_repository.dart';

class SkillUsecase {
  final SkillRepository repository;

  SkillUsecase(this.repository);

  Future<DataState<DomainAllResponse>> getDomains() async {
    final response = await repository.getDomains();
    return response;
  }

  Future<DataState<SubSkillResponse>> getSubSkills(String domain) async {
    final response = await repository.getSubSkills(domain);
    return response;
  }
}
