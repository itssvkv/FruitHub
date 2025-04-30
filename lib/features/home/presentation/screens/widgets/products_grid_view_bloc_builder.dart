import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/cubits/products_cubit/product_state.dart';
import 'package:fruit_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_app/core/helper/get_dummy_products.dart';
import 'package:fruit_app/core/widgets/custom_error_widget.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.errMessage));
        } else {
          return Skeletonizer.sliver(
              enabled: true,
              child: ProductsGridView(
                products: getDummyProducts(),
              ));
        }
      },
    );
  }
}
