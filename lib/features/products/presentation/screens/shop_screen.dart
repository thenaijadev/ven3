import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/text_field.dart';
import 'package:the_food_hub_nsk_nig/features/products/bloc/product_bloc.dart';

import 'package:the_food_hub_nsk_nig/features/products/presentation/widgets/product_item.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({
    super.key,
  });

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<String> categories = [];
  List<String> filteredCategories = [];
  @override
  void initState() {
    final ProductBloc productBloc = context.read<ProductBloc>();
    productBloc.add(ProductEventFetchProducts());
    super.initState();
  }

  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the query is empty, show all categories
        filteredCategories = List.from(categories);
      } else {
        // Otherwise, filter categories that match the query
        filteredCategories = categories
            .where((category) =>
                category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              return state is ProductStateIsLoading
                  ? const LoadingWidget()
                  : state is ProductStateProductsRetreived
                      ? Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(0),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 2 / 4,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: state.products.length,
                            itemBuilder: (BuildContext context, index) {
                              return ProductItem(
                                product: state.products[index],
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: TextWidget(
                            text: "Unable to get products",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }
}
