
import 'package:ecommerce/features/home/presentation/views/home_view.dart';
import 'package:ecommerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:ecommerce/features/product_details/presentation/views/product_details_view.dart';
import 'package:ecommerce/features/products/data/models/products_model.dart';
import 'package:ecommerce/features/products/presentation/views/products.dart';
import 'package:ecommerce/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/login/presentation/views/login_screen.dart';

abstract class AppRouter {

  static const firstPage = '/';
  static const kHomeView = '/homeView';
  static const kAuthView = '/authView';
  static const konBoardingView = '/onBoarding';
  static const kProductsView = '/products';
  static const kProductsDetailsView = '/productsDetails';

  static final router = GoRouter(routes: [
    GoRoute(path: firstPage, builder: (context, state) => const SplashView()),
    GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    GoRoute(path: kAuthView, builder: (context, state) => const LogInScreen()),
    GoRoute(path: kProductsView, builder: (context, state) =>  Products(id:state.extra as int)),
    GoRoute(
        path: kProductsDetailsView,
        builder: (context, state) =>  ProductDetailsView(productData: state.extra as ProductData,)),
    GoRoute(
        path: konBoardingView,
        builder: (context, state) => const OnBoardingView()),
  ]);
}
