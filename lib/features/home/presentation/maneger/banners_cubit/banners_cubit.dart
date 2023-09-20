import 'package:ecommerce/features/home/data/models/banners_model.dart';
import 'package:ecommerce/features/home/data/repositories/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/categories_model.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.homeRepo) : super(BannersInitial());
  final HomeRepo homeRepo;

  Future<void> fetchBanners() async {
    emit(BannersLoading());
    final result = await homeRepo.banners();
    result.fold((failure) {
      emit(BannersFailure(failure.errorMessage));
    }, (banners) {
      emit(BannersSuccess(banners));
    });
  }

}
