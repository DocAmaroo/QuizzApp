import 'package:cloud_firestore/cloud_firestore.dart';

class QuizzServices {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  QuizzServices();

  Future<QuerySnapshot> getQuestions() async {
    return await firebase.collection('questions').get();
  }

  Future<void> addQuestion(String question, String answer, String imageURL) {
    const defaultImage =
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
