import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/widgets/custom_appbar.dart';
import 'package:ecommerce/features/products/data/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({Key? key, required this.productData})
      : super(key: key);
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomAppBar(
                title: 'Details',
                icon: CupertinoIcons.back,
                onPressed: () {
                  GoRouter.of(context).pop();
                }),
            SizedBox(
              height: size.height * .02,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InteractiveViewer(
                child: SizedBox(
                  height: size.height * .4,
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
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              'NAME: ${productData.name}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: size.width * .05),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              style:
                  TextStyle(fontSize: size.width * .04, color: Colors.white70),
              'DESCRIPTION: ${productData.description}',
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price: ${productData.price}\$   ',
                  style: TextStyle(
                    fontSize: size.width * .04,
                  ),
                ),
                Text(
                  '${productData.oldPrice}',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: size.width * .04,
                      color: Colors.white70),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Text(
              'Discount: ${productData.discount} %',
              style: TextStyle(
                fontSize: size.width * .04,
              ),
            )
          ],
        ),
      ),
    );
  }
}
