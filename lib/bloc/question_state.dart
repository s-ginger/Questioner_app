part of 'question_bloc.dart';



class QuestionState {}
class QuestionInitial extends QuestionState {}
class QuestionLoading extends QuestionState {}
class QuestionLoaded extends QuestionState {
  QuestionLoaded({
    required this.trivia
  });
  final TriviaResponse trivia;
}
class QuestionError extends QuestionState {
  final String message;
  QuestionError({
    required this.message
  });
}




