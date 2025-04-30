import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_app/core/domain/repository/product_repo.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/products_screen_body.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  static const String routeName = 'products';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: ProductsScreenBody(),
    );
  }
}
