import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_button.dart';
import 'package:the_food_hub_nsk_nig/features/cart/bloc/cart_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/price_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = context.read<CartBloc>();

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .50,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state is CartStateItemAdded
                  ? state.products.isEmpty
                      ? const Center(child: TextWidget(text: "Empty"))
                      : ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return CartItemWidget(
                              amount: state.products[index].amount.toString(),
                              image: state.products[index].image!,
                              name: state.products[index].name!,
                              price: double.parse(state.products[index].price!),
                              index: index,
                              onDelete: () {
                                cartBloc.add(CartEventRemoveCartItem(
                                    product: state.products[index]));
                              },
                            );
                          },
                        )
                  : const SizedBox();
            },
          ),
        ),
        const Flexible(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PriceSummary(),
          ],
        )),
        PrimaryOrangeButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.payment);
            },
            label: "Checkout")
      ],
    );
  }
}
