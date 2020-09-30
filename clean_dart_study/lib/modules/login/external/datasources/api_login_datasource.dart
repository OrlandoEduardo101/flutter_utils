import 'package:clean_dart_study/modules/login/infra/datasources/login_datasource_interface.dart';
import 'package:clean_dart_study/modules/login/infra/models/user_model.dart';
import 'package:clean_dart_study/modules/login/domain/errors/errors.dart';
import 'package:dio/dio.dart';

class ApiLoginDataSource implements ILoginDatasource {
  final Dio dio;

  ApiLoginDataSource(this.dio);
  @override
  Future<UserModel> getUser(String email, String password) async {
    final response =
        await dio.post('path', data: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      final user = UserModel.fromJson(response.data);
      return user;
    } else {
      throw DatasourceError('Error on DataSource');
    }
  }
}
