import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
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
  @override
  void initState() {
    final ProductBloc productBloc = context.read<ProductBloc>();
    productBloc.add(ProductEventFetchProducts());
    super.initState();
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
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextWidget(
              text: "All Products",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
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
