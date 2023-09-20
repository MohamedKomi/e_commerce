import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/data/repositories/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    final result = await homeRepo.categories();
    result.fold((failure) {
      emit(CategoriesFailure(failure.errorMessage));
    }, (categories) {
      emit(CategoriesSuccess(categories));
    });
  }
}
