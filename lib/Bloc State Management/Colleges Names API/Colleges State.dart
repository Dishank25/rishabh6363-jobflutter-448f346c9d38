


// States
abstract class CollegeState {}

class CollegeInitial extends CollegeState {}

class CollegeLoading extends CollegeState {}

class CollegeLoaded extends CollegeState {
  final List<String> colleges;
  CollegeLoaded(this.colleges);
}

class CollegeError extends CollegeState {
  final String message;

  CollegeError(this.message);
}