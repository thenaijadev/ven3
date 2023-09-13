import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/products/models/product.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: .6,
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.orange),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // Image from the internet
                  Image.network(
                    widget.product.image!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        // Image is fully loaded
                        return child;
                      } else {
                        // Show a loading indicator while the image is loading
                        return const LoadingWidget();
                      }
                    },
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ScaleTransition(
                      scale: _controller
                          .drive(CurveTween(curve: Curves.easeInOut)),
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: AppColors.orange,
                          size: 32.0,
                        ),
                        onPressed: toggleFavorite,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: widget.product.name!,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextWidget(
                  text: widget.product.quantity! == 0
                      ? "Out of stock"
                      : "${widget.product.quantity!.toString()} left",
                  fontSize: 12,
                  color: AppColors.detailsGrey,
                ),
                TextWidget(
                  text: "₦${widget.product.price!}",
                  fontSize: 18,
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
