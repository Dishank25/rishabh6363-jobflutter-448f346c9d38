import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class RemoteLoginEvent extends Equatable {
  const RemoteLoginEvent();
}

class RemoteLoginData extends RemoteLoginEvent {
  final Map<String, dynamic> loginMap;

  const RemoteLoginData(this.loginMap);

  @override
  List<Object?> get props => [loginMap];
}
