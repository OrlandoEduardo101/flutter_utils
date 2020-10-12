import 'dart:convert';

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
      var jsonList = response.data['items'] as List;
      var list = jsonList
          .map((item) => ResultSearchModel(
              title: item['login'],
              img: item['avatar_url'],
              content: item['url']))
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
