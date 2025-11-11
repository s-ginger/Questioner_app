import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questioner/bloc/question_bloc/question_bloc.dart';
import 'package:questioner/repository/questioner_repository/questioner_repository.dart';


part 'questioner_event.dart';
part 'questioner_state.dart';


class QuestionerBloc extends Bloc<QuestionerEvent, QuestionerState> {
  final QuestionerRepository repo;
  final QuestionBloc _questionBloc;
  QuestionerBloc(this._questionBloc, {required this.repo}) : super(QuestionerInitial()) {
    _questionBloc.add(QuestionLoad());

    on<QuestionerPeek>((event, emit) {
      

    });
  }
}

