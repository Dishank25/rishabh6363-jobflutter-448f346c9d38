import 'dart:developer' as developer;

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/user_profile/domain/usecases/profile_usecases.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/my_profile_bloc/my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  Map<String, dynamic> skillCertificates = {};

  final UserDetailUsecase _userDetailUsecase;
  final UpdateUserProfileUsecase _updateUserProfileUsecase;

  MyProfileBloc(this._userDetailUsecase, this._updateUserProfileUsecase)
      : super(const MyProfileInitial()) {
    on<LoadMyProfileDetails>(_onLoadProfileDetails);
    on<LoadUpdateProfile>(_onUpdateUserProfile);
  }

  Future<void> _onLoadProfileDetails(
      LoadMyProfileDetails event, Emitter<MyProfileState> emit) async {
    try {
      emit(const MyProfileDetailsLoading());
      final map = {'id': event.id};
      final respones = await _userDetailUsecase(params: map);
      // developer.log('checking in bloc : ${respones.data!.firstName}');
      emit(MyProfileDetailsLoaded(respones.data!));
    } catch (e) {
      developer.log('checking error in bloc : ${e}');

      emit(const MyProfileDetailsError());
    }
  }

  Future<void> _onUpdateUserProfile(
      LoadUpdateProfile event, Emitter<MyProfileState> emit) async {
    try {
      emit(const UpdateProfileLoading());
      final map = {'id': event.id, 'params': event.params};
      final respones = await _updateUserProfileUsecase(params: map);
      // developer.log('checking in bloc : ${respones.data!.firstName}');
      emit(UpdateProfileLoaded(respones.data!));
    } catch (e) {
      developer.log('checking error in bloc : ${e}');

      emit(const UpdateProfileError());
    }
  }
}
