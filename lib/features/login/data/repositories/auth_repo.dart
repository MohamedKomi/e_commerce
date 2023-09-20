import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';

import '../auth_model/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, AuthModel>> login(String email, String password);

  Future<Either<Failures, AuthModel>> register(
      String email, String password, String phone, String name);
}
