import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Remote/API_Helper.dart';
import 'Related Skills Event.dart';
import 'Related Skills State.dart';

class RelatedSkillsBloc extends Bloc<RelatedSkillsEvent, RelatedSkillsState> {
  final RelatedSkillsRepository repository;

  RelatedSkillsBloc(this.repository) : super(RelatedSkillsInitial()) {
    on<FetchRelatedSkills>((event, emit) async {
      emit(RelatedSkillsLoading());
      try {
        final skills = await repository.fetchSkillsByDomain(event.domainName);
        emit(RelatedSkillsLoaded(skills));
      } catch (e) {
        emit(RelatedSkillsError(e.toString()));
      }
    });
  }
}