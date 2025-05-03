import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/custom_snack_bar.dart';

import 'package:fruit_app/core/widgets/main_botton.dart';
import 'package:fruit_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_app/features/home/presentation/cubits/cart_item_cubit/cart_item_state.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return MainButton(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty ) {
              Navigator.pushNamed(
                context,
                CheckoutScreen.routeName,
                arguments: context.read<CartCubit>().cartEntity,
              );
            } else {
              customSnackBar(context, 'لا يوجد منتجات في السلة');
            }
          },
          buttonText:
              'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
        );
      },
    );
  }
}
