import 'dart:convert';

import 'package:clean_dart_study/app_module.dart';
import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/domain/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'modules/search/external/datasources/github_datasource_test.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [Bind<Dio>((i) => dio)]);
  
  test('Deve recuperar o usecase sem erro', () {
    
    final usecase = Modular.get<ISearchByText>();
    expect(usecase, isA<SearchByText>());
  });

  test('Deve trazer uma lista de results search', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: jsonDecode(githubresult), statusCode: 200));
    final usecase = Modular.get<ISearchByText>();
    final result = await usecase("searchtext");
    expect(result | null, isA<List<ResultSearch>>());
  });
}
