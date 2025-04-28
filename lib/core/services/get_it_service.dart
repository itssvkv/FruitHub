import 'package:fruit_app/core/data/repository/product_repo_impl.dart';
import 'package:fruit_app/core/domain/repository/product_repo.dart';
import 'package:fruit_app/core/services/firebase_auth_service.dart';
import 'package:fruit_app/core/services/firestore_service.dart';
import 'package:fruit_app/core/services/remote_service.dart';
import 'package:fruit_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:fruit_app/features/auth/domain/repository/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<RemoteService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      remoteService: getIt<RemoteService>()));
  getIt.registerSingleton<ProductsRepo>(
      ProductRepoImpl(remoteService: getIt<RemoteService>()));
}
