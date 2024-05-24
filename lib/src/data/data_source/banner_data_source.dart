import 'dart:developer';

import 'package:advance/src/data/models/banner_model.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';

class BannerDataSource {
  Future<List<BannerData>?> getBannerList() async {
    try {
      final bannerPath = '${ApiContants.apiUrl}${ApiContants.bannerPath}';
      final queryParameters = {'limit': 5};
      final response = await Dio().get(
        bannerPath,
        queryParameters: queryParameters,
        options: Options(headers: ApiContants.headers),
      );
      final data = BannerResponse.fromJson(response.data);

      return data.data;
    } catch (e, stackTrace) {
      log('error at getBannerList: ${e.toString()} ', stackTrace: stackTrace);
      return null;
    }
  }
}
