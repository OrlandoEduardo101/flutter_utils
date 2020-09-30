import 'package:clean_dart_study/modules/login/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/login/infra/datasources/login_datasource.dart';
import 'package:clean_dart_study/modules/login/infra/models/user_model.dart';
import 'package:clean_dart_study/modules/login/infra/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LoginDataSourceMock extends Mock implements ILoginDatasource {
  
}

main() {
  final datasource = LoginDataSourceMock();
  test('must return UserLogged when receive a email and password', () async {
    when(datasource.getUser(any, any))
        .thenAnswer((_) async => UserModel());
    final repository = LoginRepository(datasource);
    final result = await repository.getUser('teste@teste.com', '1231223');
    expect(result | null, isA<UserModel>());
  });

  test('must return LeftError when has faild on datasource', () async {
    when(datasource.getUser(any, any))
        .thenThrow(Exception());
    final repository = LoginRepository(datasource);
    final result = await repository.getUser('testeteste.com', '1231223');
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
