import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/app_router.dart';
import 'package:ecommerce/features/products/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productData,
  }) : super(key: key);
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.kProductsDetailsView, extra: productData);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: size.height * .25,
                width: size.width * .42,
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
                    fit: BoxFit.cover,
                    imageUrl: productData.image!,
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),
            Text(
              productData.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: size.width * .04),
            ),
            Text(
              '${productData.price} \$',
              style: TextStyle(fontSize: size.width * .05),
            )
          ],
        ),
      ),
    );
  }
}
