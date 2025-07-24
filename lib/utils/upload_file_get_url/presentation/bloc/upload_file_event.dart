import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UploadFileEvent extends Equatable {
  const UploadFileEvent();
}

class LoadUploadFile extends UploadFileEvent {
  const LoadUploadFile();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
