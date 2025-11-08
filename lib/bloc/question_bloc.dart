import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questioner/models/models.dart';
import 'package:questioner/repository/repository.dart';
part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc(this.questionsRepo) : super(QuestionInitial()) {
    on<QuestionLoad>((event, emit) async {
      log('Loading');    
      emit(QuestionLoading());
      try {
        log('loaded');
        final triviaReponse = await questionsRepo.getTest();
        emit(QuestionLoaded(trivia: triviaReponse));
      } catch (e) {
        log('Erorr');
        emit(QuestionError(message: e.toString()));
      }
    });
  }

  final QuestionsRepoitory questionsRepo;
}
