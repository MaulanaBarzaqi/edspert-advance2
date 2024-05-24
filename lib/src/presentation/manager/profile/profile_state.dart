part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileFileInitial extends ProfileState {}

final class UploadImageLoading extends ProfileState {}

final class UploadImageSucces extends ProfileState {
  final String downloadUrl;

  const UploadImageSucces(this.downloadUrl);
}

final class UploadImageError extends ProfileState {}
