import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';
import 'package:clean_dart_study/modules/search/infra/models/result_search_model.dart';

abstract class ISearchDatasource {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}