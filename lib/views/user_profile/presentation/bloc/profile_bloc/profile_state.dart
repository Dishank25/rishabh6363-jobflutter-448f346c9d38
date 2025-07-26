import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:job_portal/views/user_profile/data/models/public_profile_model.dart';

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class PublicProfileLoading extends ProfileState {
  const PublicProfileLoading();
}

class PublicProfileLoaded extends ProfileState {
  final UserProfileModel publicProfile;

  const PublicProfileLoaded(this.publicProfile);
}

class PublicProfileError extends ProfileState {
  const PublicProfileError();
}
