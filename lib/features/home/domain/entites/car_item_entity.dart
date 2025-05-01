import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/domain/entities/product_entity.dart';

@immutable
// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quanitty;

  CartItemEntity({required this.productEntity, this.quanitty = 0});

  num calculateTotalPrice() {
    return productEntity.price * quanitty;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quanitty;
  }

  increasQuantity() {
    quanitty++;
  }

  decreasQuantity() {
    if (quanitty != 0) {
      quanitty--;
    }
  }

  @override
  List<Object?> get props => [productEntity];
}
