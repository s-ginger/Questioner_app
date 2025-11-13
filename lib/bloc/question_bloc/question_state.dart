part of 'question_bloc.dart';



class QuestionState {}
class QuestionInitial extends QuestionState {}
class QuestionPeek extends QuestionState {
  final Question question;
  QuestionPeek({
    required this.question
  });
}



class QuestionsLoaded extends QuestionState {} 

class QuestionError extends QuestionState {
  final String message;
  QuestionError({
    required this.message
  });
}




