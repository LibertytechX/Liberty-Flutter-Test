import 'package:do_it/features/authentication/data/models/create_account_info.dart';

abstract class AuthRemoteDataSource {
  /// Throws a [RemoteException] for all errors
  Future<void> createAccount(CreateAccountInfoModel userInfo);

  /// Throws a [RemoteException] for all errors
  Future<void> login(String email, String password);
}