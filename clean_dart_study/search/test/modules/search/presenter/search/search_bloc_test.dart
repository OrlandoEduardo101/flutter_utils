import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart_study/modules/search/presenter/search_bloc.dart';
import 'package:clean_dart_study/modules/search/presenter/states/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements ISearchByText {}

main() {
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);
  test('deve retornar os estados na ordem correta', () {
    when(usecase.call(any)).thenAnswer((_) async => Right(<ResultSearch>[]));

    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSucces>(),
        ]));
    bloc.add('teste');
  });

  test('deve retornarum erro', () {
    when(usecase.call(any)).thenAnswer((_) async => Left(InvalidTextError()));

    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchError>(),
        ]));
    bloc.add('teste');
  });
}
