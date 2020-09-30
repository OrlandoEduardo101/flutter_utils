import 'package:clean_dart_study/modules/login/infra/models/user_model.dart';

abstract class ILoginDatasource {
  Future<UserModel> getUser(String email, String password);
}