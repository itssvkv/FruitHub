import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/custom_snack_bar.dart';
import 'package:fruit_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          customSnackBar(context, 'تمت العملية بنجاح');
        }

        if (state is AddOrderFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return state is AddOrderLoading ? child : SizedBox();
      },
    );
  }
}
