abstract class JobLocationsState {}

class JobLocationsInitialState extends JobLocationsState{}

class JobLocationsLoadingState extends JobLocationsState{}

class JobLocationsLoadedState extends JobLocationsState {
  final List<String> jobLocations;

  JobLocationsLoadedState(  this.jobLocations);
}

class JobLocationsErrorState extends JobLocationsState{
  final String message;

  JobLocationsErrorState( this.message);
}