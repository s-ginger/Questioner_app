import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questioner/bloc/question_bloc.dart';
import 'package:questioner/view/question_page/answer_button/answer_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});
  @override
  State<StatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    context.read<QuestionBloc>().add(QuestionLoad());
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
              value: 0.3,
              minHeight: 6,
              color: Colors.blue,
              backgroundColor: Colors.grey[300],
            ),
          ),
        ),
      ),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          if (state is QuestionLoading) {
            return CircularProgressIndicator(
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              backgroundColor: Colors.purple.shade100,
            );
          } else if (state is QuestionError) {
            return Center(
              child: Column(children: [Text(state.message)]),
            );
          } else if (state is QuestionLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.7, // 70% ширины экрана
                    child: Text(
                      state.trivia.results[0].question,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 31),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: state.trivia.results[0].incorrectAnswers.map((
                      answer,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: AnswerButton(
                          answer: answer,
                          onpressed: () {
                            // обработка нажатия
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }
          return Text('Nothing');
        },
      ),
    );
  }
}
