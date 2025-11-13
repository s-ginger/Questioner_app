import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questioner/models/models.dart';
import 'package:questioner/repository/repository.dart';
part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc(this.questionsRepo, this.questionerRepo) : super(QuestionInitial()) {
    on<QuestionLoad>((event, emit) async {
      try {
        final question = questionerRepo.currentQuestion;
        question != null ? emit(QuestionPeek(question: question)) :  emit(QuestionError(message: 'Queshion == null'));
      } catch (e) {
        emit(QuestionError(message: e.toString()));
      }
    });

    on<NextQuestion>((event, emit) {
      
    });

    on<QuestionsLoad>((event, emit) async {
      try {
        final triviaReponse = await questionsRepo.getTest();
        questionerRepo.setTest(triviaReponse);
        emit(QuestionsLoaded());
      } catch (e) {
        emit(QuestionError(message: e.toString()));
      }
    });

  }

  final QuestionsRepoitory questionsRepo;
  final QuestionerRepository questionerRepo;
}
