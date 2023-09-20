import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/utils/api_services.dart';
import 'package:ecommerce/features/home/data/models/banners_model.dart';
import 'package:ecommerce/features/home/data/models/categories_model.dart';
import 'package:ecommerce/features/home/data/repositories/home_repo.dart';

class HomeRepoImplementation extends HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, List<BannerItem>>> banners() async {
    try {
      final res = await apiService.getDate(endPoint: 'banners');
      if (res['status'] == true) {
        List<BannerItem> banners = [];
        for (var item in res['data']) {
          banners.add(BannerItem.fromJson(item));
        }
        return right(banners);
      } else {
        return left(ServerFailure(res['message']));
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<CategoryItem>>> categories() async {
    try {
      final res = await apiService.getDate(endPoint: 'categories');
      if (res['status'] == true) {
        List<CategoryItem> categories = [];
        for (var item in res['data']['data']) {
          categories.add(CategoryItem.fromJson(item));
        }
        return right(categories);
      } else {
        return left(ServerFailure(res['message']));
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
