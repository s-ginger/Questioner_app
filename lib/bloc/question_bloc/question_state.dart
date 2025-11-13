part of 'question_bloc.dart';

class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionPeek extends QuestionState {
  final Question question;
  final double progress;
  QuestionPeek({required this.question, required this.progress});
}

class QuestionError extends QuestionState {
  final String message;
  QuestionError({required this.message});
  @override
  String toString() {
    return message;
  }
}

class QuestionsLoaded extends QuestionState {}

class QuestionsLoading extends QuestionState {}

class QuestionsError extends QuestionState {
  final String message;
  QuestionsError({required this.message});
  @override
  String toString() {
    return message;
  }
}
