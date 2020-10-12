import 'package:clean_dart_study/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart_study/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_dart_study/modules/search/infra/repositories/search_repository.dart';
import 'package:clean_dart_study/modules/search/presenter/search_bloc.dart';
import 'package:clean_dart_study/modules/search/presenter/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => SearchByText(i())),
    Bind((i) => SearchRepository(i())),
    Bind((i) => GithubDatasource(i())),
    Bind((i) => SearchBloc(i())),
  ];


  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => SearchPage())
  ];

  @override
  Widget get bootstrap => AppWidget();
  
}