import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/search/infra/datasource/search_datasource.dart';
import 'package:clean_dart_study/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

class GithubDatasource implements ISearchDatasource {
  final Dio dio;
  GithubDatasource(this.dio);
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final normalizeText = _normalizeText(searchText);
    final response =
        await dio.get('https://api.github.com/search/users?q=$normalizeText');
    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      return list;
    } else {
      throw DataSourceError();
    }
    // return <ResultSearchModel>[];
  }

  String _normalizeText(String searchText) {
    return searchText.replaceAll(' ', '+');
  }
}
