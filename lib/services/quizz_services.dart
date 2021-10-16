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

  Future<void> addQuestion(String question, String answer, String imageURL) {
    final defaultImage =
        'https://st.depositphotos.com/1654249/2526/i/600/depositphotos_25269357-stock-photo-3d-man-with-red-question.jpg';
    final questionCollection = firebase.collection('questions');
    return questionCollection
        .add({
          'question': question,
          'answer': answer == 'true' ? true : false,
          'imageURL': imageURL.isEmpty ? defaultImage : imageURL
        })
        .then((value) => print('Question saved!'))
        .catchError((error) => print('Failed to save question: $error'));
  }
}
