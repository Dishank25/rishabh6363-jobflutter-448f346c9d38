import 'dart:developer' as developer show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/detailed_signup/domain/usecases/skill_usecase.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/skill_bloc/skill_event.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/skill_bloc/skill_state.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  final SkillUsecase skillUsecase;

  SkillBloc(this.skillUsecase) : super(const SkillInitial()) {
    on<LoadSubSkills>(_onGetSubSkills);
    on<LoadDomains>(_onGetDomains);
  }

  Future<void> _onGetDomains(
      LoadDomains event, Emitter<SkillState> emit) async {
    try {
      emit(const SkillStateDomainLoading());
      final response = await skillUsecase.getDomains();
      emit(SkillStateDomainLoaded(response.data!)); // pass result
    } catch (e) {
      developer.log('Error in get domains in bloc : ${e}');
      emit(const SkillStateDomainError());
    }
  }

  Future<void> _onGetSubSkills(
      LoadSubSkills event, Emitter<SkillState> emit) async {
    try {
      emit(const SubSkillLoading());
      final response = await skillUsecase.getSubSkills(event.domain);
      emit(SubSkillLoaded(response.data!, event.domain)); // pass result
    } catch (e) {
      emit(const SubSkillError());
    }
  }
}
