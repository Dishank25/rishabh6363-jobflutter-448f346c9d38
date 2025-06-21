import 'dart:developer' as developer show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/login/domain/usecases/login_usecase.dart';
import 'package:job_portal/views/login/presentation/bloc/remote_login_event.dart';
import 'package:job_portal/views/login/presentation/bloc/remote_login_state.dart';

class RemoteLoginBloc extends Bloc<RemoteLoginEvent, RemoteLoginState> {
  final LoginUsecase _loginUsecase;

  RemoteLoginBloc(this._loginUsecase) : super(const RemoteLoginInitialize()) {
    on<RemoteLoginData>(_onLogin);
  }

  Future<void> _onLogin(
      RemoteLoginData event, Emitter<RemoteLoginState> emit) async {
    try {
      emit(const RemoteLoginLoading());
      final response = await _loginUsecase.userLogin(event.loginMap);
      developer.log('Ending up in bloc succes : ${response.data!}');

      emit(RemoteLoginLoaded(response.data!));
    } catch (e) {
      developer.log('Ending up in bloc error : ${e.toString()}');
      emit(const RemoteLoginError());
    }
  }
}
