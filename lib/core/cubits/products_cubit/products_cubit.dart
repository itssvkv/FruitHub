import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/cubits/products_cubit/product_state.dart';
import 'package:fruit_app/core/domain/repository/product_repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  int productsLength = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(ProductsFailure(failure.message));
        }
      },
      (products) {
            if (!isClosed) {
              emit(ProductsSuccess(products));
            }
          },
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    Future.delayed(
      Duration(seconds: 3),
      () async {
        final result = await productsRepo.getBestSellingProducts();
        result.fold(
          (failure) {
            if (!isClosed) {
              emit(ProductsFailure(failure.message));
            }
          },
          (products) {
            if (!isClosed) {
              productsLength = products.length;
              emit(ProductsSuccess(products));
            }
          },
        );
      },
    );
  }
}
