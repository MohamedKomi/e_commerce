part of 'banners_cubit.dart';

@immutable
abstract class BannersState {}

class BannersInitial extends BannersState {}

class BannersLoading extends BannersState {}

class BannersSuccess extends BannersState {
  final List<BannerItem> banners;

  BannersSuccess(this.banners);
}

class BannersFailure extends BannersState {
  final String message;

  BannersFailure(this.message);
}
