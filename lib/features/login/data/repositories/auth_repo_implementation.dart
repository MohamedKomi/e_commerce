import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/api_services.dart';
import 'package:ecommerce/features/login/data/repositories/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../auth_model/auth_model.dart';

class AuthRepoImplementation extends AuthRepo {
  final ApiService apiService;

  AuthRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, AuthModel>> login(
      String email, String password) async {
    try {
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };
      final res = await apiService.postData(endPoint: 'login', data: data);
      if (res['status'] == true) {
        return right(AuthModel.fromJson(res));
      } else {
        return left(
          ServerFailure(res['message']),
        );
      }
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, AuthModel>> register(
      String email, String password, String phone, String name) async {
    try {
      Dio dio = Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
      };
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      };
      Response response = await dio
          .post('https://student.valuxapps.com/api/register', data: data);

      if (response.data['status'] == true) {
        return right(AuthModel.fromJson(response.data));
      } else {
        return left(
          ServerFailure(response.data['message']),
        );
      }
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }


}
