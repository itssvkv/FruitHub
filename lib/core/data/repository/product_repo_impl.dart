import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/data/models/product_model.dart';
import 'package:fruit_app/core/domain/entities/product_entity.dart';
import 'package:fruit_app/core/domain/repository/product_repo.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/services/remote_service.dart';
import 'package:fruit_app/core/utils/remote_paths.dart';

class ProductRepoImpl implements ProductsRepo {
  final RemoteService remoteService;

  ProductRepoImpl({required this.remoteService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await remoteService.getData(
        path: RemotePaths.getProducts,
        query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
      ) as List<Map<String, dynamic>>;
      List<ProductModel> result =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> products = result.map((e) => e.toEntity()).toList();
      log(products.length.toString());
      return right(products);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await remoteService.getData(path: RemotePaths.getProducts)
          as List<Map<String, dynamic>>;
      List<ProductModel> result =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> products = result.map((e) => e.toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
