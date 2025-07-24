import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class JobApplyEvent extends Equatable {
  const JobApplyEvent();
}

class LoadJobApply extends JobApplyEvent {
  final String jobId;
  // final Map<String, dynamic> params;

  const LoadJobApply(
    this.jobId,
  );

  @override
  List<Object?> get props => [jobId];
}
