import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class JobDetailsEvent extends Equatable {
  const JobDetailsEvent();
}

class LoadJobDetail extends JobDetailsEvent {
  final Map<String, dynamic> jobId;
  const LoadJobDetail(this.jobId);

  @override
  List<Object?> get props => [];
}
