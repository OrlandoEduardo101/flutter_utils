import 'package:clean_dart_study/modules/login/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/login/domain/entity/user_logged.dart';
import 'package:clean_dart_study/modules/login/domain/repositories/login_repository.dart';
import 'package:clean_dart_study/modules/login/infra/datasources/login_datasource_interface.dart';
import 'package:dartz/dartz.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource datasource;
  LoginRepository(this.datasource);
  @override
  Future<Either<ILoginFailure, UserLogged>> getUser(
      String email, String password) async {
    try {
      var response = await datasource.getUser(email, password);
      return Right(response);
    } catch (e) {
      return Left(DatasourceError("Erro no Datasource"));
    }
  }
}
