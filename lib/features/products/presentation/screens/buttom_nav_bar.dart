import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/screens/main_screen.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/screens/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _selectedIndex = index;
              setState(() => _currentIndex = index);
            },
            children: const <Widget>[
              MainScreen(),
              ShopScreen(),
              MainScreen(),
              MainScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;

            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: AppColors.orange,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.shopping_bag_rounded),
                title: const Text('Shop'),
                activeColor: AppColors.orange),
            BottomNavyBarItem(
                icon: const Icon(Icons.favorite),
                title: const Text('Wish List'),
                activeColor: AppColors.orange),
            BottomNavyBarItem(
                icon: const Icon(Icons.shopping_cart_outlined),
                title: const Text('Cart'),
                activeColor: AppColors.orange),
          ],
        ));
  }
}
