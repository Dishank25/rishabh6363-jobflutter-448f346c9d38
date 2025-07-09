import 'dart:developer' as developer show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/job_related/domain/usecases/jobs_usecase.dart';
import 'package:job_portal/views/job_related/presentation/bloc/job_details_bloc/job_details_event.dart';
import 'package:job_portal/views/job_related/presentation/bloc/job_details_bloc/job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  final JobsDetailsUsecase _jobsDetailsUsecase;
  JobDetailsBloc(this._jobsDetailsUsecase) : super(const JobDetailsInitial()) {
    on<LoadJobDetail>(_onLoadJobDetail);
  }

  Future<void> _onLoadJobDetail(
      LoadJobDetail event, Emitter<JobDetailsState> emit) async {
    try {
      emit(const JobDetailsLoading());
      Map<String, dynamic> param = event.jobId;
      final response = await _jobsDetailsUsecase(params: param);
      developer.log("Details of job in bloc : ${response.data}");
      emit(JobDetailsLoaded(response.data!));
    } catch (e) {
      developer.log("Error of details of job in bloc : $e");
      emit(const JobDetailsError());
    }
  }
}
