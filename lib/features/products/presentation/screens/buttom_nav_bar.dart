import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/screens/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              MainScreen(),
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
                icon: const Icon(Icons.people),
                title: const Text('Users'),
                activeColor: AppColors.orange),
            BottomNavyBarItem(
                icon: const Icon(Icons.message),
                title: const Text('Messages'),
                activeColor: AppColors.orange),
            BottomNavyBarItem(
                icon: const Icon(Icons.settings),
                title: const Text('Settings'),
                activeColor: AppColors.orange),
          ],
        ));
  }
}
