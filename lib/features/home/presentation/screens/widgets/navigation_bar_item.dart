import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/active_item.dart';
import 'package:fruit_app/features/home/presentation/screens/widgets/in_active_item.dart';

import '../../../domain/entites/bottom_navigation_bar_entity.dart';



class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}