import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/domain/repository/orders_repo.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/services/remote_service.dart';
import 'package:fruit_app/core/utils/remote_paths.dart';
import 'package:fruit_app/features/checkout/data/models/order_model.dart';
import 'package:fruit_app/features/checkout/domain/entites/order_entity.dart';



class OrdersRepoImpl implements OrdersRepo {
  final RemoteService remoteService;

  OrdersRepoImpl(this.remoteService);
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity order}) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await remoteService.addData(
        path: RemotePaths.addOrder,
        docId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

