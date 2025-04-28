import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/search_text_field.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/best_selling_header.dart';

import 'package:fruit_app/features/home/presentation/screens/widgets/featured_list.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/home_screen_header.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/products_grid_view.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}



class _HomeScreenBodyState extends State<HomeScreenBody> {

  @override
  void initState() {
  context.read<ProductsCubit>()
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeScreenHeader(),
                SizedBox(
                  height: 16,
                ),
                SearchTextField(),
                SizedBox(
                  height: 12,
                ),
                FeaturedList(),
                SizedBox(
                  height: 12,
                ),
                BestSellingHeader(),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
          ProductsGridView(),
        ],
      ),
    );
  }
}
