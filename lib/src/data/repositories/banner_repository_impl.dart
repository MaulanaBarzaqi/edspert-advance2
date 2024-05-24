import 'package:advance/src/domain/repositories/banner_repository.dart';

import '../data.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerDataSource bannerDataSource;

  BannerRepositoryImpl(this.bannerDataSource);

  @override
  Future<List<BannerData>?> getBannerList() async {
    return bannerDataSource.getBannerList();
  }
}
