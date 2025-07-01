import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/utils/usecase/usecases.dart';
import 'package:job_portal/views/recruiter_signup/domain/entities/sigup_user_entity.dart';
import 'package:job_portal/views/recruiter_signup/domain/repository/recruiter_signup_repository.dart';
import 'package:job_portal/views/signup/data/models/signup_user_response.dart';

class RecruiterSignupUsecase
    implements UseCase<DataState<SignUpUserEntity>, Map<String, dynamic>> {
  final RecruiterSignupRepository _repository;
  RecruiterSignupUsecase(this._repository);

  @override
  Future<DataState<SignUpUserEntity>> call({Map<String, dynamic>? params}) {
    return _repository.registerUser(params ?? {});
  }
}
