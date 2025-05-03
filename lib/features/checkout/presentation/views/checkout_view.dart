import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/domain/repository/orders_repo.dart';
import 'package:fruit_app/core/helper/get_user.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_app/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruit_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_app/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';




class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late OrderInputEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(
      uID: getUser().uId,
      widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrdersRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'الشحن',
          showNotification: false,
        ),
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocBuilder(
            child: CheckoutViewBody(),
          ),
        ),
      ),
    );
  }
}
