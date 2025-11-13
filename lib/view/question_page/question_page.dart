import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questioner/bloc/question_bloc/question_bloc.dart';
import 'package:questioner/view/question_page/answer_button/answer_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});
  @override
  State<StatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  double progress = 0.0;
  String selectedAnswer = '';
  List<String> allAnswers = []; // для хранения перемешанных вариантов

  @override
  void initState() {
    super.initState();
    final bloc = context.read<QuestionBloc>();
    bloc.add(QuestionLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: null, icon: Icon(Icons.close)),
            Text("Тест"),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              color: Colors.blue,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
      ),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          if (state is QuestionLoading || state is QuestionsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            );
          } else if (state is QuestionError || state is QuestionsError) {
            return Center(child: Text(state.toString()));
          } else if (state is QuestionPeek) {
            progress = state.progress;

            if (allAnswers.isEmpty) {
              allAnswers = [
                state.question.correctAnswer,
                ...state.question.incorrectAnswers,
              ]..shuffle();
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Text(
                      state.question.question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 31),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: allAnswers.map((answer) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: AnswerButton(
                          answer: answer,
                          selected: selectedAnswer == answer,
                          onPressed: () {
                            setState(() {
                              selectedAnswer = answer;
                              context.read<QuestionBloc>().add(NextQuestion());
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
