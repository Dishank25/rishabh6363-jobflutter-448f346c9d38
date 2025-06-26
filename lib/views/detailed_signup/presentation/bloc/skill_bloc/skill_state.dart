import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:job_portal/views/detailed_signup/data/model/domian_all_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/subskill_response.dart';

@immutable
abstract class SkillState extends Equatable {
  const SkillState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SkillInitial extends SkillState {
  const SkillInitial();
}

class SubSkillLoading extends SkillState {
  const SubSkillLoading();
}

class SubSkillLoaded extends SkillState {
  final SubSkillResponse subSkillResponse;
  final String domain;

  const SubSkillLoaded(this.subSkillResponse, this.domain);
}

class SubSkillError extends SkillState {
  const SubSkillError();
}

class SkillStateDomainLoading extends SkillState {
  const SkillStateDomainLoading();
}

class SkillStateDomainLoaded extends SkillState {
  final DomainAllResponse domainAllResponse;

  const SkillStateDomainLoaded(this.domainAllResponse);
}

class SkillStateDomainError extends SkillState {
  const SkillStateDomainError();
}
