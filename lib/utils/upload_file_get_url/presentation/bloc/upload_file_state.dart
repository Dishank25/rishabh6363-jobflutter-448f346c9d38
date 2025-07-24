import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UploadFileInitial extends UploadFileState {
  const UploadFileInitial();
}

class UploadFileLoading extends UploadFileState {
  const UploadFileLoading();
}

class UploadFileLoaded extends UploadFileState {
  const UploadFileLoaded();
}

class UploadFileError extends UploadFileState {
  const UploadFileError();
}
