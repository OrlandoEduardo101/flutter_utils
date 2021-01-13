import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_dart_study/modules/search/infra/datasource/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDatasource datasource;

  SearchRepository(this.datasource);

  @override
  Future<Either<IFailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final response = await datasource.getSearch(searchText);
      return Right(response);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
