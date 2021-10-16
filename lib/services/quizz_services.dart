import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz/data/models/question.dart';

class QuizzServices {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  QuizzServices();

  Future<List<QuestionModel>> getQuestions() async {
    final questionCollection = firebase.collection('questions');
    final questionFetch = await questionCollection.get();

    return questionFetch.docs
        .map((e) => QuestionModel.fromQueryDocumentSnapshot(e))
        .toList();
  }
}
