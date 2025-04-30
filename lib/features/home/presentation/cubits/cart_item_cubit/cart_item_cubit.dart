import 'package:bloc/bloc.dart';
import 'package:fruit_app/features/home/domain/entites/car_item_entity.dart';
import 'package:fruit_app/features/home/presentation/cubits/cart_item_cubit/cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity carItem) {
    emit(CartItemUpdated(carItem));
  }
}
