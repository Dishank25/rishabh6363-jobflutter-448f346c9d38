import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/login/data/models/login_user_response.dart';

abstract class LoginRepository {
  Future<DataState<LoginUserResponse>> userLogin(Map<String, dynamic> loginMap);
}
