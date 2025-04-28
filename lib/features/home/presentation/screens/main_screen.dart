import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeScreen(),),
      bottomNavigationBar: CustomBottomNavigationBar(onItemTapped: (index){}),
    );
  }
}
