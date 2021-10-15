import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz/data/models/question.dart';
import 'package:quizz/data/question_data.dart';

class QuizzRepository {
  final List<QuestionModel> _questions = questionsData;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  QuizzRepository();

  List<QuestionModel> getQuestions() {
    getQuestionsFromFirebase();
    return _questions;
  }

  Future<List<QuestionModel>> getQuestionsFromFirebase() async {
    List<QuestionModel> questions = [];

    CollectionReference questionCollection = firebase.collection('questions');
    QuerySnapshot querySnapshot = await questionCollection.get();
    querySnapshot.docs.map((e) => print(e));

    return questions;
  }
}
