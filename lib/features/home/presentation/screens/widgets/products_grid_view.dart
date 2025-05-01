import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/product_entity.dart';
import '../../../../../core/widgets/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    // final product = ProductEntity(
    //   name: 'Apple',
    //   code: 'APL123',
    //   description: 'Fresh and juicy red apples',
    //   price: 2.5,
    //   reviews: [],
    //   expirationsMonths: 6,
    //   numberOfCalories: 95,
    //   unitAmount: 1,
    //   isOrganic: true,
    //   isFeatured: true,
    //   imageUrl:
    //       'https://i5.walmartimages.com/seo/Fresh-Gala-Apple-Each_f46d4fa7-6108-4450-a610-cc95a1ca28c5_3.38c2c5b2f003a0aafa618f3b4dc3cbbd.jpeg',
    // );

    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        log(products.toString());
        return FruitItem(
          productEntity: products[index],
        );
      },
    );
  }
}
