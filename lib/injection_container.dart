import 'package:get_it/get_it.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/utils/network/dio_client.dart';
import 'package:job_portal/utils/storage/shared_preference.dart';
import 'package:job_portal/views/detailed_signup_student/data/data_source/detailed_api_service.dart';
import 'package:job_portal/views/detailed_signup_student/data/repository/skill_repository_impl.dart';
import 'package:job_portal/views/detailed_signup_student/domain/repository/skill_repository.dart';
import 'package:job_portal/views/detailed_signup_student/domain/usecases/skill_usecase.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/signup_as_anyone_bloc/detailed_signup_bloc.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/skill_bloc/skill_bloc.dart';
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
import 'package:job_portal/views/signup_recruiter/data/data_source/recruiter_signup_api_service.dart';
import 'package:job_portal/views/signup_recruiter/data/repository/recruiter_signup_repository_impl.dart';
import 'package:job_portal/views/signup_recruiter/domain/repository/recruiter_signup_repository.dart';
import 'package:job_portal/views/signup_recruiter/domain/usecases/recruiter_signup_usecase.dart';
import 'package:job_portal/views/signup_recruiter/presentation/bloc/recruiter_signup_bloc/recruiter_signup_bloc.dart';
import 'package:job_portal/views/signup_recruiter/presentation/bloc/verify_otp_recruiter_bloc/verify_otp_recruiter_bloc.dart';
import 'package:job_portal/views/signup_student/data/data_source/signup_api_service.dart';
import 'package:job_portal/views/detailed_signup_student/data/repository/detailed_signup_repository_impl.dart';
import 'package:job_portal/views/signup_student/data/repository/signup_repository_impl.dart';
import 'package:job_portal/views/detailed_signup_student/domain/repository/detailed_signup_repository.dart';
import 'package:job_portal/views/signup_student/domain/repository/signup_repository.dart';
import 'package:job_portal/views/detailed_signup_student/domain/usecases/detailed_signup_usecase.dart';
import 'package:job_portal/views/signup_student/domain/usecase/signup_usecase.dart';
import 'package:job_portal/views/signup_student/presentation/bloc/remote_signup_bloc/remote_signup_bloc.dart';
import 'package:job_portal/views/signup_student/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:job_portal/views/signup_university/data/data_source/university_signup_api_service.dart';
import 'package:job_portal/views/signup_university/data/repository/university_signup_repository_impl.dart';
import 'package:job_portal/views/signup_university/domain/repository/university_signup_repository.dart';
import 'package:job_portal/views/signup_university/domain/usecase/university_signup_usecase.dart';
import 'package:job_portal/views/signup_university/presentation/blocs/university_signup_bloc.dart';
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
  sl.registerSingleton<UniversitySignupApiService>(
      UniversitySignupApiService(sl<DioClient>().instance));

  // Blocs
  sl.registerFactory<RemoteSignupBloc>(() => RemoteSignupBloc(sl(), sl()));
  sl.registerFactory<RemoteLoginBloc>(() => RemoteLoginBloc(sl()));
  sl.registerFactory<DetailedSignupBloc>(() => DetailedSignupBloc(sl()));
  sl.registerFactory<SkillBloc>(() => SkillBloc(sl()));
  sl.registerFactory<RecruiterSignupBloc>(
      () => RecruiterSignupBloc(sl(), sl()));
  sl.registerFactory<OpportunityBloc>(() => OpportunityBloc(sl(), sl()));
  sl.registerFactory<JobBloc>(() => JobBloc(sl()));
  sl.registerFactory<JobDetailsBloc>(() => JobDetailsBloc(sl()));
  sl.registerFactory<VerifyOtpBloc>(() => VerifyOtpBloc(sl()));
  sl.registerFactory<VerifyOtpRecruiterBloc>(
      () => VerifyOtpRecruiterBloc(sl()));
  sl.registerFactory<UniversitySignupBloc>(() => UniversitySignupBloc(sl()));

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
  sl.registerLazySingleton<SendOtpEmailUsecase>(
      () => SendOtpEmailUsecase(sl()));
  sl.registerLazySingleton<VerifyOtpEmailUsecase>(
      () => VerifyOtpEmailUsecase(sl()));
  sl.registerLazySingleton<VerifyOtpEmailRecruiterUsecase>(
      () => VerifyOtpEmailRecruiterUsecase(sl()));
  sl.registerLazySingleton<SendOtpEmailRecruiterUsecase>(
      () => SendOtpEmailRecruiterUsecase(sl()));
  sl.registerLazySingleton<CoursesUsecase>(() => CoursesUsecase(sl()));

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
  sl.registerLazySingleton<UniversitySignupRepository>(
      () => UniversitySignupRepositoryImpl(sl()));
}
