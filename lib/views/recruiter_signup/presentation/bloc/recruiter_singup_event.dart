import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RecruiterSignupEvent extends Equatable {
  const RecruiterSignupEvent();
}

class RecruiterSignupData extends RecruiterSignupEvent {
  final Map<String, dynamic> registerationMap;

  const RecruiterSignupData(this.registerationMap);

  @override
  List<Object?> get props => [registerationMap];
}
