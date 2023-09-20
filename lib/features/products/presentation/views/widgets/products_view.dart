import 'package:ecommerce/core/widgets/custom_appbar.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/products/presentation/manager/products_cubit.dart';
import 'package:ecommerce/features/products/presentation/views/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context1) {
    double _value = 50000;
    var size = MediaQuery.of(context1).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: size.height * .01,
          ),
          Padding(
            padding: EdgeInsets.all(size.width * .03),
            child: CustomAppBar(
              title: 'Products',
              icon: CupertinoIcons.back,
              onPressed: GoRouter.of(context1).pop,
            ),
          ),
          SizedBox(
            height: size.height * .04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * .065),
                child: Text(
                  'Enjoy New \nProducts',
                  style: TextStyle(
                      fontSize: size.width * .08,
                      color: Colors.white.withOpacity(.9)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context1,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return AlertDialog(
                              content: SizedBox(
                                height: size.height * .2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Price range',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ), Text(
                                      'Current price ${_value.round().toString()} \$',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Slider(
                                      label: _value.round().toString(),
                                      value: _value,
                                      activeColor: Colors.blue,
                                      divisions: 5000,
                                      thumbColor: Colors.white,
                                      inactiveColor: Colors.black,
                                      min: 10,
                                      max: 50000,
                                      // max: 100,
                                      onChanged: (double newValue) {
                                        setState(
                                          () {
                                            _value = newValue;
                                          },
                                        );
                                      },
                                    ),
                                    CustomButton(
                                      color: const Color(0xff69BCFC),
                                      text: 'Apply',
                                      onPressed: () async {
                                        await BlocProvider.of<ProductsCubit>(
                                                context1)
                                            .updateProducts(_value);
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Colors.red,
                  ),
                  width: size.width * .15,
                  height: size.height * .07,
                  child: const Icon(Icons.tune),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * .07,
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsFailure) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is ProductsSuccess) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    final item = state.products[index];
                    return ProductItem(
                      productData: item,
                    );
                  },
                );
              } else if (state is UpdatedProductsSuccess) {
                if (state.filteredProducts.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(45.0),
                      child: Text(

                        'There is no product that fits your price !!\n😔',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    final item = state.filteredProducts[index];
                    return ProductItem(
                      productData: item,
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
