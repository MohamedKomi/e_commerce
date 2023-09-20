import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/api_services.dart';
import 'package:ecommerce/features/home/data/repositories/home_repo_implementation.dart';
import 'package:ecommerce/features/login/data/repositories/auth_repo_implementation.dart';
import 'package:ecommerce/features/products/data/repositories/products_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerSingleton<ApiService>(ApiService(Dio()));
    sl.registerSingleton<AuthRepoImplementation>(AuthRepoImplementation(sl()));
    sl.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(sl()));
    sl.registerSingleton<ProductsRepoImplementation>(ProductsRepoImplementation(sl()));
  }
}
