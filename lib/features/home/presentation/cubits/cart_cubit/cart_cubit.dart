import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/domain/entities/product_entity.dart';
import 'package:fruit_app/features/home/domain/entites/car_item_entity.dart';
import 'package:fruit_app/features/home/domain/entites/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExis(productEntity);
    var carItem = cartEntity.getCarItem(productEntity);
    if (isProductExist) {
      carItem.increasQuantity();
    } else {
      cartEntity.addCartItem(carItem);
    }
    emit(CartItemAdded());
  }

  void deleteCarItem(CartItemEntity carItem) {
    cartEntity.removeCarItem(carItem);
    emit(CartItemRemoved());
  }
}
