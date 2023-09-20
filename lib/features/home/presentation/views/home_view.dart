import 'package:ecommerce/features/home/data/repositories/home_repo_implementation.dart';
import 'package:ecommerce/features/home/presentation/maneger/banners_cubit/banners_cubit.dart';
import 'package:ecommerce/features/home/presentation/maneger/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                BannersCubit(sl<HomeRepoImplementation>())..fetchBanners()),
        BlocProvider(
            create: (context) => CategoriesCubit(sl<HomeRepoImplementation>())
              ..fetchCategories())
      ],
      child: const Scaffold(
        body: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
