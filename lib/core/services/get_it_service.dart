import 'package:fruit_app/core/services/firebase_auth_service.dart';
import 'package:fruit_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:fruit_app/features/auth/domain/repository/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()));
}
