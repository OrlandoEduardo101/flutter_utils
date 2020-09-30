import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/search/infra/datasource/search_datasource.dart';
import 'package:clean_dart_study/modules/search/infra/models/result_search_model.dart';
import 'package:clean_dart_study/modules/search/infra/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements ISearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepository(datasource);
  test('must return a ResultSearch list', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search('smaaalll');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('must return a DataSourceError if datasource failed', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search('smaaalll');
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
