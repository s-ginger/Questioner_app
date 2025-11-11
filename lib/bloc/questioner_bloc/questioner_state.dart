

part of 'questioner_bloc.dart';



class QuestionerState {}
class QuestionerInitial extends QuestionerState {}
class QuestionerLoading extends QuestionerState {}
class QuestionerLoaded extends QuestionerState {


}

class QuestionerError extends QuestionerState {
  final String message;
  QuestionerError({
    required this.message
  });
}


