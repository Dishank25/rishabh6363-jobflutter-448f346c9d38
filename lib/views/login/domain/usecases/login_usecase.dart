import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/login/data/models/login_user_response.dart';
import 'package:job_portal/views/login/domain/repository/login_repository.dart';

class LoginUsecase {
  final LoginRepository _repository;

  LoginUsecase(this._repository);

  Future<DataState<LoginUserResponse>> userLogin(
      Map<String, dynamic> loginMap) async {
    final response = await _repository.userLogin(loginMap);
    return response;
  }
}
