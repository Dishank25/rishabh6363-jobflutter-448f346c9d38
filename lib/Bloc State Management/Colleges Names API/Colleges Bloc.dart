import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Remote/API_Helper.dart';
import 'Colleges Event.dart';
import 'Colleges State.dart';

class CollegeBloc extends Bloc<CollegeEvent, CollegeState> {
  final CollegeRepository repository;

  CollegeBloc(this.repository) : super(CollegeInitial()) {
    on<FetchColleges>((event, emit) async {
      emit(CollegeLoading());
      try {
        final colleges = await repository.fetchColleges();
        emit(CollegeLoaded(colleges));
      } catch (e) {
        print('Error fetching colleges: $e'); //
        emit(CollegeError('Failed to fetch colleges'));
      }
    });
  }
}