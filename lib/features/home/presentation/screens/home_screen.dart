import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeScreenBody(),),
      bottomNavigationBar: CustomBottomNavigationBar(onItemTapped: (index){}),
    );
  }
}
