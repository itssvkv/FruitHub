import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/best_selling_fruits/presentation/screens/widgets/best_selling_screen_body.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});
  static const routeName = 'best_selling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: const BestSellingScreenBody(),
    );
  }
}
