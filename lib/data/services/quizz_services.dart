import 'package:cloud_firestore/cloud_firestore.dart';

class QuizzServices {
  final _quizzCollection = FirebaseFirestore.instance.collection('quizz');

  QuizzServices();

  get quizzCollection => _quizzCollection;

  Stream<QuerySnapshot> getQuestionsSnapshotByThemeId(String themeId) {
    return _quizzCollection.doc(themeId).collection('questions').snapshots();
  }

  Future<void> addTheme(String theme, String description) {
    return _quizzCollection
        .add({'theme': theme, 'description': description})
        .then((value) => print('Theme saved!'))
        .catchError((error) => print('Failed to save question: $error'));
  }

  Future<void> addQuestion(
      String question, String answer, String imageURL, String themeId) {
    const defaultImage =
        'https://st.depositphotos.com/1654249/2526/i/600/depositphotos_25269357-stock-photo-3d-man-with-red-question.jpg';
    final questionCollection =
        _quizzCollection.doc(themeId).collection('questions');
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
