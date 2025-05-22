import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Remote/API_Helper.dart';
import 'Course Event.dart';
import 'Course State.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc(this.courseRepository) : super(CourseInitial()) {
    on<FetchCourses>((event, emit) async {
      emit(CourseLoading());
      try {
        final courses = await courseRepository.fetchCourses();
        emit(CourseLoaded(courses));
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });
  }
}