import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:job_portal/views/login/data/models/login_user_response.dart';

@immutable
abstract class RemoteLoginState extends Equatable {
  const RemoteLoginState();

  @override
  List<Object?> get props => [];
}

class RemoteLoginInitialize extends RemoteLoginState {
  const RemoteLoginInitialize();
}

class RemoteLoginLoading extends RemoteLoginState {
  const RemoteLoginLoading();
}

class RemoteLoginLoaded extends RemoteLoginState {
  final LoginUserResponse loginUserResponse;

  const RemoteLoginLoaded(this.loginUserResponse);
}

class RemoteLoginError extends RemoteLoginState {
  const RemoteLoginError();
}
