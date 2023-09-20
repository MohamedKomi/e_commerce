import 'package:ecommerce/features/products/data/repositories/products_repo.dart';
import 'package:ecommerce/features/products/data/repositories/products_repo_implementation.dart';
import 'package:ecommerce/features/products/presentation/manager/products_cubit.dart';
import 'package:ecommerce/features/products/presentation/views/widgets/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';

class Products extends StatelessWidget {
  final int id;
  const Products({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(sl<ProductsRepoImplementation>())..fetchProducts(id),
      child: const Scaffold(
        body: SafeArea(
          child: ProductsView(),
        ),
      ),
    );
  }
}
