import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SkillEvent extends Equatable {
  const SkillEvent();
}

class LoadDomains extends SkillEvent {
  const LoadDomains();

  @override
  List<Object?> get props => [];
}

class LoadSubSkills extends SkillEvent {
  final String domain;
  const LoadSubSkills(this.domain);

  @override
  List<Object?> get props => [];
}
