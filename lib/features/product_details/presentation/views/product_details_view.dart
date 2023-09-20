import 'package:ecommerce/features/products/data/models/products_model.dart';
import 'package:flutter/material.dart';

import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.productData}) : super(key: key);
 final ProductData productData;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: ProductDetailsViewBody(productData: productData,),
      ),
    );
  }
}
