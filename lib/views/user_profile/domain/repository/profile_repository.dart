import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/user_profile/data/models/public_profile_model.dart';
import 'package:job_portal/views/user_profile/domain/entities/terms_and_conditions_entity.dart';
import 'package:job_portal/views/user_profile/domain/entities/user_details_entity.dart';

abstract class ProfileRepository {
  Future<DataState<UserProfileModel>> getPublicProfile(String id);

  Future<DataState<UserDetailEntity>> getUserDetails(String id);

  Future<DataState<TermsAndConditionEntity>> getTermsAndConditions();
}
