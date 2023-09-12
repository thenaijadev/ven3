import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/screens/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const MainScreen(),
      const MainScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.home,
        ),
        title: ("Home"),
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: const Color.fromARGB(255, 0, 0, 0),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        activeColorSecondary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.store_outlined,
          size: 30,
        ),
        title: ("Store"),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        activeColorSecondary: Colors.black,
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: const Color.fromARGB(255, 0, 0, 0),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: const Color.fromARGB(255, 255, 46, 46),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}
