import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {
  final String message; // e.g. "Password reset successful"

  const ResetPasswordSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ResetPasswordFailedState extends ResetPasswordState {
  final String errorMsg;

  const ResetPasswordFailedState({required this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
