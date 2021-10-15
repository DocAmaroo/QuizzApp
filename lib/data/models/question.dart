class QuestionModel {
  String question;
  bool answer;
  String imageURL;

  QuestionModel(
      {required this.question, required this.answer, required this.imageURL});

  String get getQuestion => question;
  bool get getAnswer => answer;
  String get getImageURL => imageURL;
}
