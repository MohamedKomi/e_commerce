import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/data/models/products_model.dart';

import '../../../../core/errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductData>>> getProducts(int id);
}
