import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class MyProfileEvent extends Equatable {
  const MyProfileEvent();
}

class PickResume extends MyProfileEvent {
  const PickResume();

  @override
  List<Object?> get props => [];
}

class LoadMyProfileDetails extends MyProfileEvent {
  final String id;
  const LoadMyProfileDetails(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
