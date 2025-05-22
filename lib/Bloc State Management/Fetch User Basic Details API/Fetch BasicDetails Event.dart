abstract class FetchUserEvent {}

class FetchUserDetailsEvent extends FetchUserEvent {
  final String email;
  FetchUserDetailsEvent({required this.email});
}