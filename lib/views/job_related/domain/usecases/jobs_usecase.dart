import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/utils/usecase/usecases.dart';
import 'package:job_portal/views/job_related/domain/entities/all_jobs_entity.dart';
import 'package:job_portal/views/job_related/domain/entities/job_details_entity.dart';
import 'package:job_portal/views/job_related/domain/repository/jobs_repository.dart';

class JobsUsecase
    implements UseCase<DataState<List<AllJobsEntity>>, Map<String, dynamic>> {
  final JobsRepository _repository;
  JobsUsecase(this._repository);

  @override
  Future<DataState<List<AllJobsEntity>>> call(
      {Map<String, dynamic>? params}) async {
    return _repository.getOpportunities();
  }
}

class JobsDetailsUsecase
    implements UseCase<DataState<JobDetailsEntity>, Map<String, dynamic>> {
  final JobsRepository _repository;
  JobsDetailsUsecase(this._repository);

  @override
  Future<DataState<JobDetailsEntity>> call(
      {Map<String, dynamic>? params}) async {
    return _repository.getJobDetails(params!['jobId']);
  }
}
