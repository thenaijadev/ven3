import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/loading_widget.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/snackbar.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/cart/bloc/cart_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/quantity_row.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/widgets/add_to_cart_button.dart';
import 'package:the_food_hub_nsk_nig/features/products/product_bloc/product_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
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
    final ProductBloc bloc = context.read<ProductBloc>();
    bloc.add(ProductEventFetchProduct(
        id: widget.data["product"], products: widget.data["products"]));
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

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductStateIsLoading) {
              return const LoadingWidget();
            } else if (state is ProductStateProductRetreived) {
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .4,
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
                            state.product.image!,
                            width: double.infinity,
                            height: 400,
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
                            top: 60,
                            right: 10,
                            child: ScaleTransition(
                              scale: _controller
                                  .drive(CurveTween(curve: Curves.easeInOut)),
                              child: IconButton(
                                icon: Row(
                                  children: [
                                    Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: AppColors.orange,
                                      size: 32.0,
                                    ),
                                  ],
                                ),
                                onPressed: toggleFavorite,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 60,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.chevron_left,
                                size: 40,
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .52,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(46, 254, 115, 76),
                          borderRadius: BorderRadius.circular(30).copyWith(
                              bottomRight: Radius.zero,
                              bottomLeft: Radius.zero),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextWidget(
                                    text: state.product.name!,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )
                                ],
                              ),
                              TextWidget(
                                text: state.product.brand!.name!,
                                fontSize: 14,
                                color: const Color.fromARGB(194, 225, 86, 0),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text:
                                    "₦${(double.parse(state.product.price!) * quantity).round()}",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: QuantityRow(
                                        onReduce: () {
                                          setState(() {
                                            if (quantity > 0) {
                                              quantity--;
                                            }
                                          });
                                        },
                                        onIncrease: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        quantity: quantity),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 110,
                                child: ListView(
                                    padding: const EdgeInsets.all(0),
                                    children: [
                                      TextWidget(
                                        text: state.product.description!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            const Color.fromARGB(194, 0, 0, 0),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Expanded(
                                child: SizedBox(
                                  height: 10,
                                ),
                              ),
                              BlocListener<CartBloc, CartState>(
                                listener: (context, state) {
                                  if (state is CartStateItemAdded) {
                                    InfoSnackBar.showSuccessSnackBar(
                                        context, "Product added to cart");
                                  }
                                },
                                child: AddToCartButton(
                                  onTap: () {
                                    final product = state.product
                                        .copyWith(amount: quantity);
                                    final CartBloc bloc =
                                        context.read<CartBloc>();
                                    bloc.add(
                                        CartEventAddProduct(product: product));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: "Unable to get products.",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        final ProductBloc bloc = context.read<ProductBloc>();
                        bloc.add(ProductEventFetchProduct(
                            id: widget.data["product"],
                            products: widget.data["products"]));
                      },
                      child: const Icon(
                        Icons.refresh,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
