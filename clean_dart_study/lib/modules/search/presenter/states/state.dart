import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';

abstract class ISearchState {}

class SearchSucces implements ISearchState {
  final List<ResultSearch> list;

  SearchSucces(this.list);
}

class SearchStart implements ISearchState {}

class SearchLoading implements ISearchState {}

class SearchError implements ISearchState {
  final IFailureSearch erro;

  SearchError(this.erro);
}
