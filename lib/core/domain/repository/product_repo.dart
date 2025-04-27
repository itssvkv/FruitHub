import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/domain/entities/product_entity.dart';
import 'package:fruit_app/core/errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}