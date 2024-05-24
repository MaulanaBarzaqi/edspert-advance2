part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class UploadImageEvent extends ProfileEvent {
  final XFile file;

  const UploadImageEvent(this.file);
}
