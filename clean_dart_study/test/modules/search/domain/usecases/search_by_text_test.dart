import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_dart_study/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements ISearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByText(repository);
  test('Must return ResultSearch list', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    final result = await usecase("SMAAAALLL");
    expect(result, isA<Right>());
    expect(result | null, isA<List<ResultSearch>>());
  });
  test('Must return exception if invalid text', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    var result = await usecase(null);
    expect(result | null, null);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());
    result = await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
