import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String? id;
  String question;
  bool answer;
  String imageURL;

  QuestionModel(
      {this.id,
      required this.question,
      required this.answer,
      required this.imageURL});

  String get getQuestion => question;
  bool get getAnswer => answer;
  String get getImageURL => imageURL;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'imageURL': imageURL
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
        id: map['id'],
        question: map['question'],
        answer: map['answer'],
        imageURL: map['imageURL']);
  }

  factory QuestionModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final id = snapshot.id;
    data['id'] = id;
    return QuestionModel.fromMap(data);
  }
}
