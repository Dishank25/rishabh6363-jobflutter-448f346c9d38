import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Data/Remote/API_Helper.dart';

import 'Job Role Event.dart';
import 'Job Role State.dart';

class JobRoleBloc extends Bloc<JobRoleEvent, JobRoleState> {
  final JobRoleRepository repository;

  JobRoleBloc(this.repository) : super(JobRoleInitialState()) {
    on<FetchJobRoles>((event, emit) async {
      emit(JobRoleInitialState());
      try {
        final specializations = await repository.fetchJobRoles();
        emit(JobRoleLoadedState(specializations));
      } catch (e) {
        emit(JobRoleErrorState('Failed to fetch specializations'));
      }
    });
  }
}
