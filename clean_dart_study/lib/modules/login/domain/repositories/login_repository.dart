import 'package:clean_dart_study/modules/login/domain/entity/user_logged.dart';
import 'package:clean_dart_study/modules/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginRepository {
  Future<Either<ILoginFailure, UserLogged>> getUser(String email, String password);
}
