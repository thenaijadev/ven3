import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/text_field.dart';
import 'package:the_food_hub_nsk_nig/features/products/bloc/product_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/products/models/product.dart';

import 'package:the_food_hub_nsk_nig/features/products/presentation/widgets/product_item.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({
    super.key,
  });

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<Product> produts = [];
  List<Product> filteredProducts = [];
  @override
  void initState() {
    final ProductBloc productBloc = context.read<ProductBloc>();
    productBloc.add(ProductEventFetchProducts());
    setState(() {
      filterProducts("");
    });
    super.initState();
  }

  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts = List.from(produts);
    } else {
      filteredProducts = produts
          .where((product) =>
              product.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    filterProducts("");
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ).copyWith(top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "All Products",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          InputFieldWidget(
              padding: const EdgeInsets.all(0),
              label: "",
              verticalContentPadding: 0,
              hintText: "Search",
              onChanged: (val) {
                filterProducts(val!);
              },
              suffixIcon: const Icon(
                Icons.search,
              ),
              textFieldkey: formKey),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProductStateIsLoading) {
                return const LoadingWidget();
              } else if (state is ProductStateProductsRetreived) {
                produts = state.products;

                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(0),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2 / 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: filteredProducts.length,
                    itemBuilder: (BuildContext context, index) {
                      return ProductItem(
                        product: filteredProducts[index],
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: TextWidget(
                    text: "Unable to get products",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
