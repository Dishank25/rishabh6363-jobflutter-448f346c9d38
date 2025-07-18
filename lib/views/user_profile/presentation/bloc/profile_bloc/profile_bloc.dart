import 'dart:developer' as developer show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/user_profile/domain/usecases/profile_usecases.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:job_portal/views/user_profile/presentation/bloc/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecase _profileUsecase;
  ProfileBloc(this._profileUsecase) : super(const ProfileInitial()) {
    on<LoadPublicProfile>(_onLoadPublicProfile);
  }

  Future<void> _onLoadPublicProfile(
      LoadPublicProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(const PublicProfileLoading());
      final map = {'id': event.id};
      final respones = await _profileUsecase(params: map);
      // developer.log('checking in bloc : ${respones.data!.firstName}');
      emit(PublicProfileLoaded(respones.data!));
    } catch (e) {
      developer.log('checking error in bloc : ${e}');

      emit(const PublicProfileError());
    }
  }
}
