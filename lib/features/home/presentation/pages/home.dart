import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "assets/images/swallow.jpg",
    "assets/images/rice.jpg",
    "assets/images/pasta.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
