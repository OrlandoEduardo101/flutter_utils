import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchByText {
  Future<Either<IFailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByText implements ISearchByText {
  final ISearchRepository repository;

  SearchByText(this.repository);

  @override
  Future<Either<IFailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
