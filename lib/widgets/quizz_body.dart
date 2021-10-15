import 'package:flutter/widgets.dart';
import 'package:quizz/data/models/question.dart';

class QuizzBody extends StatelessWidget {
  final QuestionModel questionModel;

  const QuizzBody({Key? key, required this.questionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 20, children: <Widget>[_getQuestion(), _getImage(context)]);
  }

  Container _getQuestion() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(questionModel.getQuestion,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)));
  }

  Center _getImage(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: NetworkImage(questionModel.imageURL),
                  fit: BoxFit.cover))),
    );
  }
}
