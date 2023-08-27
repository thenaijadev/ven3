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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const TextWidget(
          text: "Cart",
          fontSize: 18,
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Transform.translate(
            offset: const Offset(20, 0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: Colors.white,
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return state is CartStateItemAdded
                    ? state.meals.isEmpty
                        ? const Center(child: TextWidget(text: "Empty"))
                        : ListView.builder(
                            itemCount: state.meals.length,
                            itemBuilder: (context, index) {
                              return CartItemWidget(
                                index: index,
                                onDelete: () {},
                              );
                            },
                          )
                    : const SizedBox();
              },
            ),
          ),
          const Flexible(child: PriceSummary()),
          PrimaryOrangeButton(
              onTap: () {
                Navigator.pushNamed(context, Routes.payment);
              },
              label: "Checkout")
        ],
      ),
    );
  }
}
