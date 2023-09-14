import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/text_field.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/widgets/product_category_item.dart';
import 'package:the_food_hub_nsk_nig/features/products/product_bloc/product_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> categories = [];
  List<String> filteredCategories = [];
  @override
  void initState() {
    final ProductBloc productBloc = context.read<ProductBloc>();
    productBloc.add(ProductEventFetchProducts());
    super.initState();
  }

  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  void filterCategories(String query) {
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
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductStateIsLoading) {
          return const Center(child: LoadingWidget());
        } else if (state is ProductStateProductsRetreived) {
          final products = state.products;

          for (var product in products) {
            String? categoryName = product.category?.name;
            if (!categories.contains(categoryName)) {
              categories.add(categoryName!);
              filteredCategories = categories;
            }
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ).copyWith(top: 20),
                child: InputFieldWidget(
                    label: "",
                    verticalContentPadding: 0,
                    hintText: "Search",
                    onChanged: (val) {
                      filterCategories(val!);
                    },
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    textFieldkey: formKey),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10),
                child: TextWidget(
                  text: "Categories",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              filteredCategories.isEmpty
                  ? const Expanded(
                      child: Center(
                          child: TextWidget(
                      text: "Category does not exist",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )))
                  : Flexible(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: filteredCategories.length,
                          itemBuilder: (context, index) {
                            return ProductCategoryItem(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.categoryProducts,
                                    arguments: {
                                      "products": state.products,
                                      "category": filteredCategories[index]
                                    });
                              },
                              name: filteredCategories[index],
                            );
                          }),
                    )
            ],
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget(
                  text: "Unable to get product categories",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () {
                    final ProductBloc bloc = context.read<ProductBloc>();
                    bloc.add(ProductEventFetchProducts());
                  },
                  child: const Icon(
                    Icons.refresh,
                    color: AppColors.orange,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
