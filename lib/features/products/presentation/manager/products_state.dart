part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductData> products;

  ProductsSuccess(this.products);
}

class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure(this.message);
}

class UpdatedProductsSuccess extends ProductsState {
  final List<ProductData> filteredProducts;

  UpdatedProductsSuccess(this.filteredProducts);
}
