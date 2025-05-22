import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Remote/API_Helper.dart';
import 'Specialization Event.dart';
import 'Specialization State.dart';

class SpecializationBloc extends Bloc<SpecializationEvent, SpecializationState> {
  final SpecializationRepository repository;

  SpecializationBloc(this.repository) : super(SpecializationInitial()) {
    on<FetchSpecializations>((event, emit) async {
      emit(SpecializationLoading());
      try {
        final specializations = await repository.fetchSpecializations();
        emit(SpecializationLoaded(specializations));
      } catch (e) {
        emit(SpecializationError('Failed to fetch specializations'));
      }
    });
  }
}
