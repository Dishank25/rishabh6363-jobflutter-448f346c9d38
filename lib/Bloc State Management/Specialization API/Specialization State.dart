abstract class SpecializationState {}

class SpecializationInitial extends SpecializationState {}

class SpecializationLoading extends SpecializationState {}

class SpecializationLoaded extends SpecializationState {
  final List<String> specializations;

  SpecializationLoaded(  this.specializations);
}

class SpecializationError extends SpecializationState{
  final String message;

  SpecializationError( this.message);
}