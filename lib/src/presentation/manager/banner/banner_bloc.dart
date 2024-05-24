import 'package:advance/src/domain/entities/banner_entity.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/get_banner_list_usecase.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannerListUsecase getBannerListUsecase;

  BannerBloc(this.getBannerListUsecase) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerEvent) {
        emit(BannerLoading());
        final result = await getBannerListUsecase();
        if (result == null) {
          emit(BannerError());
          return;
        }
        emit(
          BannerSuccess(
            bannerList: result
                .map(
                  (e) => BannerEntity(
                    imageUrl: e.eventImage ?? '',
                    redirectUrl: e.eventUrl ?? '',
                  ),
                )
                .toList(),
          ),
        );
      } else if (event is GetLatestBannerEvent) {
        print('GetLatestBannerEvent');
      }
    });
  }
}
