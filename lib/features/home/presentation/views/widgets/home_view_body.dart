import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/widgets/custom_appbar.dart';
import 'package:ecommerce/features/home/presentation/maneger/banners_cubit/banners_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'featured_categories.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .07),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .01,
            ),
            CustomAppBar(
              title: 'Home',
              icon: Icons.grid_view_sharp,
              onPressed: () {},
            ),
            SizedBox(
              height: size.height * .05,
            ),
            BlocBuilder<BannersCubit, BannersState>(
              builder: (context, state) {
                if (state is BannersSuccess) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: size.height * .25,
                      aspectRatio: 12 / 9,
                      viewportFraction: 0.8,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    items: state.banners
                        .map(
                          (item) =>
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: InteractiveViewer(
                              child:  CachedNetworkImage(
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                fit: BoxFit.fill,
                                imageUrl: item.image!,
                                errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                              ),
                            ),
                          ),
                    )
                        .toList(),
                  );
                } else if (state is BannersFailure) {
                  return SizedBox(height: size.height * .3,
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return SizedBox(height: size.height * .3,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: size.height * .03,
            ),
            Text(
              'CATEGORIES',
              style: TextStyle(fontSize: size.width * .07),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            const FeaturedCategories(),
          ],
        ),
      ),
    );
  }
}
