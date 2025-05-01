import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/custom_snack_bar.dart';
import 'package:fruit_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
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
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is CartItemAdded) {
              customSnackBar(context, 'تمت العملية بنجاح');
            } else if (state is CartItemRemoved) {
              customSnackBar(context, 'تم حذف العنصر بنجاح');
            }
          },
          child: Scaffold(
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
            bottomNavigationBar:
                CustomBottomNavigationBar(onItemTapped: (index) {
              currentBottomNavScreenIndex = index;
              setState(() {});
            }),
          )),
    );
  }
}
