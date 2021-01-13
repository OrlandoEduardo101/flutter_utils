import 'dart:convert';

import 'package:clean_dart_study/modules/search/domain/entity/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String img;
  final String title;
  final String content;

  ResultSearchModel( {this.img, this.title, this.content});

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'title': title,
      'content': content,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResultSearchModel(
      img: map['img'],
      title: map['title'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) => ResultSearchModel.fromMap(json.decode(source));
}
