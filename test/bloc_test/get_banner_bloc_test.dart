import 'package:advance/src/data/data.dart';
import 'package:advance/src/data/repositories/banner_repository_impl.dart';
import 'package:advance/src/data/repositories/repositories.dart';
import 'package:advance/src/domain/usecase/get_banner_list_usecase.dart';
import 'package:advance/src/presentation/manager/banner/banner_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../usecase/get_banner_list_usecase_test.mocks.dart';
import 'get_banner_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BannerRepositoryImpl>()])
void main() {
  late GetBannerListUsecase usecase;
  late MockBannerRepositoryImpl bannerRepositoryImpl;

  setUp(() {
    bannerRepositoryImpl = MockBannerRepositoryImpl();

    usecase = GetBannerListUsecase(bannerRepositoryImpl);
  });

  blocTest<BannerBloc, BannerState>(
    'Get banner success',
    build: () {
      when(bannerRepositoryImpl.getBannerList())
          .thenAnswer((realinvocation) async => []);
      return BannerBloc(usecase);
    },
    act: (bloc) => bloc.add(GetBannerEvent()),
    expect: () => <BannerState>[BannerLoading(), BannerSuccess(bannerList: [])],
  );
}
