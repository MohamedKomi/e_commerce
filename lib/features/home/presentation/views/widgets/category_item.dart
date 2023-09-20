import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.imgUrl, required this.name, required this.id})
      : super(key: key);
  final String imgUrl;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProductsView, extra: id);
      },
      child: SizedBox(
        height: size.height * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width * .8,
              height: size.height * .2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InteractiveViewer(
                  child: CachedNetworkImage(
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
                    imageUrl: imgUrl,
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(fontSize: size.width * .06, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
