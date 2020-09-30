import 'package:clean_dart_study/modules/login/domain/entity/user_logged.dart';
import 'package:clean_dart_study/modules/login/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginWithEmailPassword {
  Future<Either<ILoginFailure, UserLogged>> call(String email, String password);
}

class LoginWithEmailPassword implements ILoginWithEmailPassword {
  final ILoginRepository repository;

  LoginWithEmailPassword(this.repository);
  @override
  Future<Either<ILoginFailure, UserLogged>> call(String email, String password) async {
    if (!email.contains('@')) {
      return Left(NotValidParams('Invalid params'));
    }
    return await repository.getUser(email, password);
  }
}
