import 'dart:convert';
import 'package:clean_dart_study/modules/login/external/datasources/api_login_datasource.dart';
import 'package:clean_dart_study/modules/login/domain/errors/errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = ApiLoginDataSource(dio);
  test("must return UserModel when params email and password as pass", () {
    when(dio.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response(data: jsonDecode(userTest), statusCode: 200));
    final future = datasource.getUser('teste@teste.com', 'password');
    expect(future, completes);
  });

  test("Must return error when has error if status code not equals 200", () {
    when(dio.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response(data: null, statusCode: 401));
    final future = datasource.getUser('testeteste.com', 'password');
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test("Must return Exception when dio error", () async {
    when(dio.post(any, data: anyNamed('data')))
        .thenThrow(Exception());
    final future = datasource.getUser('teste@teste.com', 'password');
  expect(future, throwsA(isA<Exception>()));
  });
}

const String userTest = '''
    {
  "email":"teste@teste.com",
  "name":"teste testador",
  "token":"token de teste",
  "imgUrl":"url da imagem"
}
''';
