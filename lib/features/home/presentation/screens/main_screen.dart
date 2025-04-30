import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/presentation/screens/cart_screen.dart';
import 'package:fruit_app/features/home/presentation/screens/products_screen.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = 'home';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentBottomNavScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentBottomNavScreenIndex,
          children: [
            HomeScreen(),
            ProductsScreen(),
            CartScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onItemTapped: (index) {
        currentBottomNavScreenIndex = index;
        setState(() {});
      }),
    );
  }
}
