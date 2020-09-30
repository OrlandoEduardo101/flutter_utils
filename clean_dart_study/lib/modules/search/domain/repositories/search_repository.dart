import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepository {
  Future<Either<IFailureSearch, List<ResultSearch>>> search(String searchText);
}
