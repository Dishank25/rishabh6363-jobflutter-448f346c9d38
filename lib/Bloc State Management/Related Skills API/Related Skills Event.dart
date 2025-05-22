import 'package:equatable/equatable.dart';

abstract class RelatedSkillsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRelatedSkills extends RelatedSkillsEvent {
  final String domainName;

  FetchRelatedSkills(this.domainName);

  @override
  List<Object> get props => [domainName];
}