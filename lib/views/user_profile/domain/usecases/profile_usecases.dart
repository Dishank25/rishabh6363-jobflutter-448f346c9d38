import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/utils/usecase/usecases.dart';
import 'package:job_portal/views/user_profile/data/models/public_profile_model.dart';
import 'package:job_portal/views/user_profile/data/models/user_details_response.dart';
import 'package:job_portal/views/user_profile/domain/entities/public_profile_entity.dart';
import 'package:job_portal/views/user_profile/domain/entities/terms_and_conditions_entity.dart';
import 'package:job_portal/views/user_profile/domain/entities/user_details_entity.dart';
import 'package:job_portal/views/user_profile/domain/repository/profile_repository.dart';

class ProfileUsecase
    implements UseCase<DataState<UserProfileModel>, Map<String, dynamic>> {
  final ProfileRepository _repository;
  ProfileUsecase(this._repository);

  @override
  Future<DataState<UserProfileModel>> call(
      {Map<String, dynamic>? params}) async {
    return _repository.getPublicProfile(params!['id']);
  }
}

class UserDetailUsecase
    implements UseCase<DataState<UserDetailEntity>, Map<String, dynamic>> {
  final ProfileRepository _repository;
  UserDetailUsecase(this._repository);

  @override
  Future<DataState<UserDetailEntity>> call(
      {Map<String, dynamic>? params}) async {
    return _repository.getUserDetails(params!['id']);
  }
}

class TermsAndConditionsUsecase
    implements
        UseCase<DataState<TermsAndConditionEntity>, Map<String, dynamic>> {
  final ProfileRepository _repository;
  TermsAndConditionsUsecase(this._repository);

  @override
  Future<DataState<TermsAndConditionEntity>> call(
      {Map<String, dynamic>? params}) async {
    return _repository.getTermsAndConditions();
  }
}
