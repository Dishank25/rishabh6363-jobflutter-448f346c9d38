import 'package:get_it/get_it.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/utils/network/dio_client.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/detailed_signup/data/data_source/detailed_api_service.dart';
import 'package:job_portal/views/detailed_signup/data/repository/skill_repository_impl.dart';
import 'package:job_portal/views/detailed_signup/domain/repository/skill_repository.dart';
import 'package:job_portal/views/detailed_signup/domain/usecases/skill_usecase.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/signup_as_anyone_bloc/detailed_signup_bloc.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/skill_bloc/skill_bloc.dart';
import 'package:job_portal/views/job_related/data/data_source/job_screens_api_service.dart';
import 'package:job_portal/views/job_related/data/repository/jobs_repository_impl.dart';
import 'package:job_portal/views/job_related/domain/repository/jobs_repository.dart';
import 'package:job_portal/views/job_related/domain/usecases/jobs_usecase.dart';
import 'package:job_portal/views/job_related/presentation/bloc/job_bloc/job_bloc.dart';
import 'package:job_portal/views/job_related/presentation/bloc/job_details_bloc/job_details_bloc.dart';
import 'package:job_portal/views/login/data/data_source/login_api_service.dart';
import 'package:job_portal/views/login/data/repository/login_repository_impl.dart';
import 'package:job_portal/views/login/domain/repository/login_repository.dart';
import 'package:job_portal/views/login/domain/usecases/login_usecase.dart';
import 'package:job_portal/views/login/presentation/bloc/remote_login_bloc.dart';
import 'package:job_portal/views/post_opportunities/data/data_sources/opportunities_api_service.dart';
import 'package:job_portal/views/post_opportunities/data/repository/opportunities_repository_impl.dart';
import 'package:job_portal/views/post_opportunities/domain/repository/opportunity_repository.dart';
import 'package:job_portal/views/post_opportunities/domain/usecases/metadata_usecase.dart';
import 'package:job_portal/views/post_opportunities/presentation/bloc/opportunity_bloc.dart';
import 'package:job_portal/views/recruiter_signup/data/data_source/recruiter_signup_api_service.dart';
import 'package:job_portal/views/recruiter_signup/data/repository/recruiter_signup_repository_impl.dart';
import 'package:job_portal/views/recruiter_signup/domain/repository/recruiter_signup_repository.dart';
import 'package:job_portal/views/recruiter_signup/domain/usecases/recruiter_signup_usecase.dart';
import 'package:job_portal/views/recruiter_signup/presentation/bloc/recruiter_signup_bloc.dart';
import 'package:job_portal/views/signup/data/data_source/signup_api_service.dart';
import 'package:job_portal/views/detailed_signup/data/repository/detailed_signup_repository_impl.dart';
import 'package:job_portal/views/signup/data/repository/signup_repository_impl.dart';
import 'package:job_portal/views/detailed_signup/domain/repository/detailed_signup_repository.dart';
import 'package:job_portal/views/signup/domain/repository/signup_repository.dart';
import 'package:job_portal/views/detailed_signup/domain/usecases/detailed_signup_usecase.dart';
import 'package:job_portal/views/signup/domain/usecase/signup_usecase.dart';
import 'package:job_portal/views/signup/presentation/bloc/remote_signup_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPreference = await SharedPreferences.getInstance();
  // Register Shared Preference
  sl.registerSingleton<SharedPreferences>(sharedPreference);
  // Register Preference Manager passing the shared preference instance
  sl.registerSingleton<PreferencesManager>(
      await PreferencesManager.create(sharedPreference));

  // Register dio client
  sl.registerSingleton<DioClient>(DioClient(Urls.baseUrl));

  // Dependencies / Api services
  sl.registerSingleton<SignupApiService>(
      SignupApiService(sl<DioClient>().instance));
  sl.registerSingleton<LoginApiService>(
      LoginApiService(sl<DioClient>().instance));
  sl.registerSingleton<DetailedApiService>(
      DetailedApiService(sl<DioClient>().instance));
  sl.registerSingleton<RecruiterSignupApiService>(
      RecruiterSignupApiService(sl<DioClient>().instance));
  sl.registerSingleton<OpportunitiesApiService>(
      OpportunitiesApiService(sl<DioClient>().instance));
  sl.registerSingleton<JobScreensApiService>(
      JobScreensApiService(sl<DioClient>().instance));

  // Blocs
  sl.registerFactory<RemoteSignupBloc>(() => RemoteSignupBloc(
        sl(),
        // sl()
      ));
  sl.registerFactory<RemoteLoginBloc>(() => RemoteLoginBloc(sl()));
  sl.registerFactory<DetailedSignupBloc>(() => DetailedSignupBloc(sl()));
  sl.registerFactory<SkillBloc>(() => SkillBloc(sl()));
  sl.registerFactory<RecruiterSignupBloc>(() => RecruiterSignupBloc(sl()));
  sl.registerFactory<OpportunityBloc>(() => OpportunityBloc(sl(), sl()));
  sl.registerFactory<JobBloc>(() => JobBloc(
        sl(),
      ));
  sl.registerFactory<JobDetailsBloc>(() => JobDetailsBloc(
        sl(),
      ));

  // Use Cases
  sl.registerLazySingleton<SignupUsecase>(() => SignupUsecase(sl()));
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
  sl.registerLazySingleton<DetailedSignupUsecase>(
      () => DetailedSignupUsecase(sl()));
  sl.registerLazySingleton<SkillUsecase>(() => SkillUsecase(sl()));
  sl.registerLazySingleton<RecruiterSignupUsecase>(
      () => RecruiterSignupUsecase(sl()));
  sl.registerLazySingleton<MetadataUsecase>(() => MetadataUsecase(sl()));
  sl.registerLazySingleton<CreateJobPostUsecase>(
      () => CreateJobPostUsecase(sl()));
  sl.registerLazySingleton<JobsUsecase>(() => JobsUsecase(sl()));
  sl.registerLazySingleton<JobsDetailsUsecase>(() => JobsDetailsUsecase(sl()));

  // Repository
  sl.registerLazySingleton<SignupRepository>(() => SignupRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton<DetailedSignupRepository>(
      () => DetailedSignupRepositoryImpl(sl()));
  sl.registerLazySingleton<SkillRepository>(() => SkillRepositoryImpl(sl()));
  sl.registerLazySingleton<RecruiterSignupRepository>(
      () => RecruiterSignupRepositoryImpl(sl()));
  sl.registerLazySingleton<OpportunityRepository>(
      () => OpportunitiesRepositoryImpl(sl()));
  sl.registerLazySingleton<JobsRepository>(() => JobsRepositoryImpl(sl()));
}
