import 'dart:developer' as developer show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/job_related/domain/usecases/jobs_usecase.dart';
import 'package:job_portal/views/job_related/presentation/bloc/job_details_bloc/job_details_event.dart';
import 'package:job_portal/views/job_related/presentation/bloc/job_details_bloc/job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  final JobsDetailsUsecase _jobsDetailsUsecase;
  final JobApplyUsecase _jobApplyUsecase;
  JobDetailsBloc(this._jobsDetailsUsecase, this._jobApplyUsecase)
      : super(const JobDetailsInitial()) {
    on<LoadJobDetail>(_onLoadJobDetail);
    // on<LoadJobApply>(_onJobApply);
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

  // Future<void> _onJobApply(
  //     LoadJobApply event, Emitter<JobDetailsState> emit) async {
  //   try {
  //     emit(const JobApplyLoading());
  //     final map = {
  //       'jobId': event.jobId,
  //       'params': {
  //         "whyShouldWeHireYou": "I am highly skilled and motivated.",
  //         "confirmAvailability": "Yes",
  //         "project": "Project description here",
  //         "githubLink": "https://github.com/yourprofile",
  //         "portfolioLink": "https://yourportfolio.com",
  //         "education": "B.tech"
  //       }
  //     };
  //     final response = await _jobApplyUsecase(params: map);
  //     developer.log("Details of job in bloc : ${response.data}");
  //     emit(JobApplyLoaded(response.data!));
  //   } catch (e) {
  //     developer.log("Error of details of job in bloc : $e");
  //     emit(const JobApplyError());
  //   }
  // }
}
