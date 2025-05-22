import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/Remote/API_Helper.dart';
import 'Job Locations Event.dart';
import 'Job Locations State.dart';

class JobLocationsBloc extends Bloc<JobLocationEvent, JobLocationsState> {
  final JobLocationRepository repository;

  JobLocationsBloc(this.repository) : super(JobLocationsInitialState()) {
    on<FetchJobLocations>((event, emit) async {
      emit(JobLocationsLoadingState());
      try {
        final specializations = await repository.fetchJobLocations();
        emit(JobLocationsLoadedState(specializations));
      } catch (e) {
        emit(JobLocationsErrorState('Failed to fetch specializations'));
      }
    });
  }
}
