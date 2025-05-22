import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Remote/API_Helper.dart';
import 'DomainSkills Event.dart';
import 'DomainSkills State.dart';

class DomainBloc extends Bloc<DomainEvent, DomainState> {
  final DomainRepository repository;

  DomainBloc(this.repository) : super(DomainInitial()) {
    on<FetchDomains>((event, emit) async {
      emit(DomainLoading());
      try {
        final domains = await repository.fetchDomains();
        emit(DomainLoaded(domains));
      } catch (e) {
        emit(DomainError('Failed to fetch domains'));
      }
    });
  }
}