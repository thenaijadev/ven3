import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/products/data/models/product.dart';

import 'package:the_food_hub_nsk_nig/features/products/presentation/widgets/product_item.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key, required this.productData});
  final Map<String, dynamic> productData;

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  List<Product> filteredProducts = [];
  void filterProduct() {
    final List<Product> products = widget.productData["products"];
    List<Product> theProducts = products.where(
      (element) {
        return element.category?.name == widget.productData["category"];
      },
    ).toList();
    filteredProducts.addAll(theProducts);
  }

  @override
  Widget build(BuildContext context) {
    filterProduct();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ).copyWith(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      size: 40,
                      color: AppColors.orange,
                    ),
                  ),
                  TextWidget(
                    text: "${widget.productData["category"]}",
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: filteredProducts.length,
                itemBuilder: (BuildContext context, index) {
                  return ProductItem(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.productDetails,
                          arguments: {
                            "product": filteredProducts[index].id,
                            "products": widget.productData["products"]
                          });
                    },
                    product: filteredProducts[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
