part of 'banner_bloc.dart';

@immutable
sealed class BannerState extends Equatable {}

final class BannerInitial extends BannerState {
  @override
  List<Object?> get props => [];
}

final class BannerLoading extends BannerState {
  @override
  List<Object?> get props => [];
}

final class BannerSuccess extends BannerState {
  final List<BannerEntity> bannerList;

  BannerSuccess({required this.bannerList});

  @override
  List<Object?> get props => [bannerList];
}

final class BannerError extends BannerState {
  final String message;

  BannerError({this.message = 'Unexpected Error'});

  @override
  List<Object?> get props => [message];
}
