import 'package:advance/src/data/data.dart';
import 'package:advance/src/data/models/banner_model.dart';
import 'package:advance/src/data/repositories/banner_repository_impl.dart';
import 'package:advance/src/data/repositories/repositories.dart';
import 'package:advance/src/domain/usecase/get_banner_list_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_banner_list_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BannerRepositoryImpl>()])
void main() {
  late GetBannerListUsecase usecase;
  late MockBannerRepositoryImpl bannerRepositoryImpl;

  setUp(() {
    bannerRepositoryImpl = MockBannerRepositoryImpl();

    usecase = GetBannerListUsecase(bannerRepositoryImpl);
  });

  group('get banner test case', () {
    test('Get banner empty data', () async {
      when(bannerRepositoryImpl.getBannerList())
          .thenAnswer((realinvocation) async => []);

      final result = await usecase();
      expect(result, []);
      verify(bannerRepositoryImpl.getBannerList());
      verifyNoMoreInteractions(bannerRepositoryImpl);
    });
    test('Get banner test null data', () async {
      when(bannerRepositoryImpl.getBannerList())
          .thenAnswer((realinvocation) async => null);

      final result = await usecase();
      expect(result, null);
      verify(bannerRepositoryImpl.getBannerList());
      verifyNoMoreInteractions(bannerRepositoryImpl);
    });
    test('Get banner test filled data', () async {
      List<BannerData> data = [
        BannerData(eventDescription: 'error bro', eventTitle: 'mbuh nang ndi')
      ];
      when(bannerRepositoryImpl.getBannerList())
          .thenAnswer((realinvocation) async => data);

      final result = await usecase();
      expect(result, data);
      verify(bannerRepositoryImpl.getBannerList());
      verifyNoMoreInteractions(bannerRepositoryImpl);
    });
  });
}
