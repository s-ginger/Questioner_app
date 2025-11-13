import 'package:flutter_bloc/flutter_bloc.dart';
import '/models/models.dart';
import '/repository/repository.dart';
part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc(this.questionsRepo, this.questionerRepo)
      : super(QuestionInitial()) {
    // загрузка текущего вопроса
    on<QuestionLoad>((event, emit) async {
      emit(QuestionLoading());
      try {
        final question = questionerRepo.currentQuestion;
        final double progress =
            questionerRepo.index / questionerRepo.totalQuestions;
        if (question != null) {
          emit(QuestionPeek(question: question, progress: progress));
        } else {
          emit(QuestionError(message: 'Нет текущего вопроса'));
        }
      } catch (e) {
        emit(QuestionError(message: e.toString()));
      }
    });

    // переход к следующему вопросу
    on<NextQuestion>((event, emit) {
      questionerRepo.next();
      final question = questionerRepo.currentQuestion;
      final double progress =
          questionerRepo.index / questionerRepo.totalQuestions;
      if (question != null) {
        emit(QuestionPeek(question: question, progress: progress));
      } else {
        emit(QuestionError(message: 'Больше нет вопросов'));
      }
    });

    // загрузка теста
    on<QuestionsLoad>((event, emit) async {
      try {
        final triviaReponse = await questionsRepo.getTest();
        questionerRepo.setTest(triviaReponse);
      } catch (e) {
        emit(QuestionsError(message: e.toString()));
      }
    });
  }

  final QuestionsRepoitory questionsRepo;
  final QuestionerRepository questionerRepo;
}
