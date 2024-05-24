import 'package:advance/src/domain/repositories/banner_repository.dart';

import '../../data/models/models.dart';

class GetBannerListUsecase {
  final BannerRepository repository;

  GetBannerListUsecase(this.repository);

  Future<List<BannerData>?> call() {
    return repository.getBannerList();
  }
}
