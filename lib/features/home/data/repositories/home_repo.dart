import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/data/models/banners_model.dart';
import 'package:ecommerce/features/home/data/models/categories_model.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BannerItem>>> banners();

  Future<Either<Failures, List<CategoryItem>>> categories();
}
