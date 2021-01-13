import 'dart:convert';

import 'package:clean_dart_study/modules/search/domain/errors/errors.dart';
import 'package:clean_dart_study/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);
  test("must return ResultSearchModel when pass text search params", () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: jsonDecode(githubresult), statusCode: 200));
    final future = datasource.getSearch('searchtext');
    expect(future, completes);
  });

  test("must return error when statuscode diferent 200", () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));
    final future = datasource.getSearch('OrlandoEduardo101');
  expect(future, throwsA(isA<DataSourceError>()));
  });

  test("must return Exception when dio error", () async {
    when(dio.get(any))
        .thenThrow(Exception());
    final future = datasource.getSearch('OrlandoEduardo101');
  expect(future, throwsA(isA<Exception>()));
  });

}

const String githubresult = ''' 
{
  "total_count": 1,
  "incomplete_results": false,
  "items": [
    {
      "login": "OrlandoEduardo101",
      "id": 37966182,
      "node_id": "MDQ6VXNlcjM3OTY2MTgy",
      "avatar_url": "https://avatars1.githubusercontent.com/u/37966182?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/OrlandoEduardo101",
      "html_url": "https://github.com/OrlandoEduardo101",
      "followers_url": "https://api.github.com/users/OrlandoEduardo101/followers",
      "following_url": "https://api.github.com/users/OrlandoEduardo101/following{/other_user}",
      "gists_url": "https://api.github.com/users/OrlandoEduardo101/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/OrlandoEduardo101/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/OrlandoEduardo101/subscriptions",
      "organizations_url": "https://api.github.com/users/OrlandoEduardo101/orgs",
      "repos_url": "https://api.github.com/users/OrlandoEduardo101/repos",
      "events_url": "https://api.github.com/users/OrlandoEduardo101/events{/privacy}",
      "received_events_url": "https://api.github.com/users/OrlandoEduardo101/received_events",
      "type": "User",
      "site_admin": false,
      "score": 1.0
    }
  ]
}
''';
