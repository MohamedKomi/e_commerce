import 'package:ecommerce/features/home/presentation/maneger/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/category_item.dart';

class FeaturedCategories extends StatelessWidget {
  const FeaturedCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CategoryItem(
                imgUrl: state.categories[index].image!,
                name: state.categories[index].name!,
                id: state.categories[index].id!,
              );
            },
            itemCount: state.categories.length,
          );
        } else if (state is CategoriesFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return SizedBox(
              height: size.height * .4,
              child: const Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}
