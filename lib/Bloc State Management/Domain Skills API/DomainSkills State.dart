import 'Domain Model/Domain Model.dart';

abstract class DomainState {}

class DomainInitial extends DomainState {}

class DomainLoading extends DomainState {}

class DomainLoaded extends DomainState {
  final List<DomainModel> domains;

  DomainLoaded(this.domains);
}

class DomainError extends DomainState {
  final String message;

  DomainError(this.message);
}