import 'package:flutter_triple/flutter_triple.dart';

class HomeStore {
  List<QuestionsByCategory> listQuestionsByCategory = [
    QuestionsByCategory(
      category: 'Category 1',
      questions: <QuestionList>[
        QuestionList(
          answer: 'answer',
          categoryId: '0',
          categoryName: 'Category 1',
          question: 'Questtion 1'
        ),
        QuestionList(
          answer: 'answer',
          categoryId: '1',
          categoryName: 'Category 1',
          question: 'Questtion 2'
        )
      ]
      ),
      QuestionsByCategory(
      category: 'Category 2',
      questions: <QuestionList>[
        QuestionList(
          answer: 'answer',
          categoryId: '0',
          categoryName: 'Category 2',
          question: 'Questtion 1'
        ),
        QuestionList(
          answer: 'answer',
          categoryId: '1',
          categoryName: 'Category 2',
          question: 'Questtion 2'
        )
      ]
      )
  ];
}

class QuestionsByCategory {
  String? category;
  List<QuestionList>? questions;

  QuestionsByCategory({this.questions, this.category});
  QuestionsByCategory copyWith({
    String? category,
    List<QuestionList>? questions,
  }) {
    return QuestionsByCategory(
      category: category ?? this.category,
      questions: questions ?? this.questions,
    );
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionsByCategory && other.category == category;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => category.hashCode ^ questions.hashCode;
}

class QuestionList {
  QuestionList({
    this.answer,
    this.categoryId,
    this.question,
    this.categoryName,
  });

  String? answer;
  String? categoryId;
  String? question;
  String? categoryName;
  factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
        answer: json['answer'] == null ? null : json['answer'],
        categoryId: json['categoryId'] == null ? null : json['categoryId'],
        question: json['question'] == null ? null : json['question'],
        categoryName:
            json['categoryName'] == null ? null : json['categoryName'],
      );
}
