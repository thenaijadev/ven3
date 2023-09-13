import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/products/models/product.dart';

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
    print(theProducts.length);
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
              child: TextWidget(
                text: "${widget.productData["category"]}",
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
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

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.orange),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(product.image!), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
