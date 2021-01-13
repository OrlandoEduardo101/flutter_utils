import 'package:clean_dart_study/modules/login/domain/entity/user_logged.dart';
import 'package:clean_dart_study/modules/login/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/login/domain/repositories/login_repository.dart';
import 'package:clean_dart_study/modules/login/domain/usecases/login_with_email_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

main() {
  final repository = LoginRepositoryMock();
  test('must return UserLogged when receive a email and password', () async {
    when(repository.getUser(any, any))
        .thenAnswer((_) async => Right(UserLogged()));
    final usecase = LoginWithEmailPassword(repository);
    final result = await usecase('teste@teste.com', '1231223');
    expect(result | null, isA<UserLogged>());
  });

  test('must return um errot when receive invalids entries', () async {
    when(repository.getUser(any, any))
        .thenAnswer((_) async => Right(UserLogged()));
    final usecase = LoginWithEmailPassword(repository);
    final result = await usecase('testeteste.com', '1231223');
    expect(result.fold(id, id), isA<NotValidParams>());
  });
}
