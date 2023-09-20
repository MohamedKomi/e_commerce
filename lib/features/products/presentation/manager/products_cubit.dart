import 'package:ecommerce/features/products/data/repositories/products_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/products_model.dart';
import '../../data/models/products_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  List<ProductData> allProducts = [];

  List<ProductData> filteredProducts = [];

  Future<void> fetchProducts(int id) async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts(id);

    result.fold((failure) {
      emit(ProductsFailure(failure.errorMessage));
    }, (products) {
      emit(ProductsSuccess(products));
      allProducts = products;
    });
  }

  Future<void> updateProducts(double price) async {
    emit(ProductsLoading());
    filteredProducts.clear();
    for (var item in allProducts) {
      if (item.price! < price && !filteredProducts.contains(item)) {
        filteredProducts.add(item);
      }
    }

    emit(UpdatedProductsSuccess(filteredProducts));
  }
}
