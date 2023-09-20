import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/products/data/models/products_model.dart';
import 'package:ecommerce/features/products/data/repositories/products_repo.dart';

import '../../../../core/utils/api_services.dart';

class ProductsRepoImplementation extends ProductsRepo {
  final ApiService apiService;

  ProductsRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, List<ProductData>>> getProducts(int id) async {
    try {
      final res = await apiService.getDate(endPoint: 'categories/$id');

      if (res['status'] == true) {

        List<ProductData> products = [];
        for (var i in res['data']['data']) {
          products.add(ProductData.fromJson(i));
        }

        return right(products);
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
