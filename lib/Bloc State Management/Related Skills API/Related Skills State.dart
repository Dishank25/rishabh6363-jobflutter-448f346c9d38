import 'package:equatable/equatable.dart';

import 'Related Skills Model/Related Skills Model.dart';

abstract class RelatedSkillsState extends Equatable {
  @override
  List<Object> get props => [];
}

class RelatedSkillsInitial extends RelatedSkillsState {}

class RelatedSkillsLoading extends RelatedSkillsState {}

class RelatedSkillsLoaded extends RelatedSkillsState {
  final List<RelatedSkillModel> skills;

  RelatedSkillsLoaded(this.skills);

  @override
  List<Object> get props => [skills];
}

class RelatedSkillsError extends RelatedSkillsState {
  final String message;

  RelatedSkillsError(this.message);

  @override
  List<Object> get props => [message];
}